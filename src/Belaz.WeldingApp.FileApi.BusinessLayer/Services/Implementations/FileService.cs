using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.FileApi.BusinessLayer.Helpers.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelDeviationReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.SeamPassport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Dtos.DeviationsReportInfo;
using Belaz.WeldingApp.FileApi.Domain.Exceptions;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using LanguageExt;
using LanguageExt.Common;
using Microsoft.AspNetCore.Hosting;
using QuestPDF.Fluent;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;

public class FileService : IFileService
{
    private readonly ITaskRepository _taskRepository;
    private readonly IWebHostEnvironment _environment;
    private readonly IMarkEstimateService _markEstimateService;
    private readonly IValidationService _validationService;
    private readonly IExcelFileService<List<WeldPassageDeviationsDto>> _excelDeviationReportService;
    private readonly IWeldPassageRepository _weldPassageRepository;

    public FileService(
        ITaskRepository taskRepository,
        IWebHostEnvironment environment,
        IMarkEstimateService markEstimateService,
        IValidationService validationService,
        IExcelFileService<List<WeldPassageDeviationsDto>> excelDeviationReportService,
        IWeldPassageRepository weldPassageRepository
    )
    {
        _taskRepository = taskRepository;
        _environment = environment;
        _markEstimateService = markEstimateService;
        _validationService = validationService;
        _excelDeviationReportService = excelDeviationReportService;
        _weldPassageRepository = weldPassageRepository;
    }

    public async Task<Result<DocumentDto>> GenerateExcelDeviationReportByWorkshopAsync(
        GenerateExcelDeviationReportByWorkshopRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            var dateStart = request.StartDate.ToDateTime();
            var dateEnd = request.EndDate.ToDateTime();

            var deviations =
                await _weldPassageRepository.GetAllDeviationsByWorkshopAndDatePeriodAsync(
                    request.WorkshopId,
                    request.ProductId,
                    request.SeamId,
                    dateStart,
                    dateEnd
                );

            if (!deviations.Any())
            {
                throw new ListIsEmptyException();
            }

            return await _excelDeviationReportService.GenerateReportAsync(deviations);
        });
    }

    public async Task<Result<DocumentDto>> GenerateSeamPassportByTaskIdAsync(
        GenerateSeamPassportByTaskIdRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            var task = await _taskRepository.GetByIdAsync(request.TaskId);

            var fontsPath = Path.Combine(_environment.WebRootPath, $"fonts");
            var document = new SeamPassportDocument(task, fontsPath, _markEstimateService);

            byte[] bytes;
            using (var stream = new MemoryStream())
            {
                document.GeneratePdf(stream);
                bytes = stream.ToArray();
            }

            var result = new DocumentDto
            {
                FileName = $"Паспорт Шва №{task.Seam.Number}.pdf",
                FileType = FileTypes.PdfType,
                Bytes = bytes
            };

            return result;
        });
    }
}
