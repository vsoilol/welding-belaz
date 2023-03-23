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
    private readonly IExcelFileService<SeamAmountDto> _excelSeamAmountReportService;
    private readonly IExcelFileService<EquipmentOperationTimeDto> _excelEquipmentOperationTimeReportService;
    private readonly IExcelFileService<
        List<EquipmentDowntimeDto>
    > _excelEquipmentDowntimeReportService;
    private readonly IExcelFileService<
        List<EquipmentOperationTimeWithShiftDto>
    > _excelEquipmentOperationAnalysisReportService;
    private readonly IExcelFileService<WelderOperationTimeDto> _excelWelderOperationReportService;

    public FileService(
        ITaskRepository taskRepository,
        IWebHostEnvironment environment,
        IMarkEstimateService markEstimateService,
        IValidationService validationService,
        IExcelFileService<List<WeldPassageDeviationsDto>> excelDeviationReportService,
        IWeldPassageRepository weldPassageRepository,
        IExcelFileService<SeamAmountDto> excelSeamAmountReportService,
        IExcelFileService<EquipmentOperationTimeDto> excelEquipmentOperationTimeReportService,
        IExcelFileService<List<EquipmentDowntimeDto>> excelEquipmentDowntimeReportService,
        IExcelFileService<
            List<EquipmentOperationTimeWithShiftDto>
        > excelEquipmentOperationAnalysisReportService,
        IExcelFileService<WelderOperationTimeDto> excelWelderOperationReportService
    )
    {
        _taskRepository = taskRepository;
        _environment = environment;
        _markEstimateService = markEstimateService;
        _validationService = validationService;
        _excelDeviationReportService = excelDeviationReportService;
        _weldPassageRepository = weldPassageRepository;
        _excelSeamAmountReportService = excelSeamAmountReportService;
        _excelEquipmentOperationTimeReportService = excelEquipmentOperationTimeReportService;
        _excelEquipmentDowntimeReportService = excelEquipmentDowntimeReportService;
        _excelEquipmentOperationAnalysisReportService =
            excelEquipmentOperationAnalysisReportService;
        _excelWelderOperationReportService = excelWelderOperationReportService;
    }

    public async Task<Result<DocumentDto>> GenerateSeamPassportByTaskIdAsync(
        GenerateSeamPassportByTaskIdRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

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
    }

    public Task<Result<DocumentDto>> GenerateExcelDeviationReportByWorkshopAsync(
        GenerateExcelDeviationReportByWorkshopRequest request
    )
    {
        return GenerateExcelDeviationReportAsync(
            request,
            request.WorkshopId,
            _weldPassageRepository.GetAllDeviationsByWorkshopAndDatePeriodAsync
        );
    }

    public Task<Result<DocumentDto>> GenerateExcelDeviationReportByProductionAreaAsync(
        GenerateExcelDeviationReportByProductionAreaRequest request
    )
    {
        return GenerateExcelDeviationReportAsync(
            request,
            request.ProductionAreaId,
            _weldPassageRepository.GetAllDeviationsByProductionAreaAndDatePeriodAsync
        );
    }

    public Task<Result<DocumentDto>> GenerateExcelDeviationReportByWelderAsync(
        GenerateExcelDeviationReportByWelderRequest request
    )
    {
        return GenerateExcelDeviationReportAsync(
            request,
            request.WelderId,
            _weldPassageRepository.GetAllDeviationsByWelderAndDatePeriodAsync
        );
    }

    private async Task<Result<DocumentDto>> GenerateExcelDeviationReportAsync<T>(
        T request,
        Guid additionalId,
        Func<
            Guid,
            Guid,
            Guid?,
            DateTime,
            DateTime,
            Task<List<WeldPassageDeviationsDto>>
        > getAllDeviationsFunc
    )
        where T : GenerateExcelDeviationReportRequest
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var deviations = await getAllDeviationsFunc(
            additionalId,
            request.ProductId,
            request.SeamId,
            dateStart,
            dateEnd
        );

        if (!deviations.Any())
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        return await _excelDeviationReportService.GenerateReportAsync(deviations);
    }

    public async Task<Result<DocumentDto>> GenerateExcelSeamAmountReportAsync()
    {
        var seamAmount = new SeamAmountDto
        {
            NumControlledRegistrar = 500,
            NumAddedManually = 2000,
            NumDeviantWelding = 10,
            NumRejectedRegistrar = 10,
            NumRejectedManually = 150
        };

        return await _excelSeamAmountReportService.GenerateReportAsync(seamAmount);
    }

    public async Task<Result<DocumentDto>> GenerateExcelEquipmentOperationTimeReportAsync()
    {
        var equipmentOperationTime = new EquipmentOperationTimeDto
        {
            OffTimeMinutes = 300,
            OnTimeMinutes = 60,
            WorkTimeMinutes = 250,
            DowntimeMinutes = 110
        };

        return await _excelEquipmentOperationTimeReportService.GenerateReportAsync(
            equipmentOperationTime
        );
    }

    public async Task<Result<DocumentDto>> GenerateExcelEquipmentDowntimeReportAsync()
    {
        var equipmentDowntimeDtos = new List<EquipmentDowntimeDto>
        {
            new() { Reason = "Плановый ремонт", Time = 300 },
            new() { Reason = "Аварийный ремонт", Time = 0 },
            new() { Reason = "Отсутствие заданий", Time = 250 },
            new() { Reason = "Отсутствие материала, заготовок, деталей", Time = 410 },
            new()
            {
                Reason = "Отсутствие инструмента, оснастки, вспомогательного оборудования",
                Time = 520
            },
            new() { Reason = "Отсутствие крана, транспорта", Time = 430 },
            new() { Reason = "Отсутствие сварщика в связи с необеспеченностью", Time = 0 },
            new() { Reason = "Неявка сварщика (б/лист, отпуск и др.)", Time = 32 },
            new() { Reason = "Отсутствие энергоносителей", Time = 15 },
            new() { Reason = "Отсутствие сотрудника ОТК", Time = 0 },
            new()
            {
                Reason = "Отсутствие конструктора, технолога или ожидание его решения",
                Time = 160
            },
            new() { Reason = "Естественные надобности", Time = 323 }
        };

        return await _excelEquipmentDowntimeReportService.GenerateReportAsync(
            equipmentDowntimeDtos
        );
    }

    public async Task<Result<DocumentDto>> GenerateExcelEquipmentOperationAnalysisReportAsync()
    {
        var equipmentOperationTimeWithShiftDtos = new List<EquipmentOperationTimeWithShiftDto>
        {
            new()
            {
                WorkingShifNumber = 1,
                OffTimeMinutes = 120,
                OnTimeMinutes = 80,
                WorkTimeMinutes = 132,
                DowntimeMinutes = 118
            },
            new()
            {
                WorkingShifNumber = 2,
                OffTimeMinutes = 133,
                OnTimeMinutes = 92,
                WorkTimeMinutes = 140,
                DowntimeMinutes = 105
            },
            new()
            {
                WorkingShifNumber = 3,
                OffTimeMinutes = 145,
                OnTimeMinutes = 98,
                WorkTimeMinutes = 125,
                DowntimeMinutes = 82
            }
        };

        return await _excelEquipmentOperationAnalysisReportService.GenerateReportAsync(
            equipmentOperationTimeWithShiftDtos
        );
    }

    public async Task<Result<DocumentDto>> GenerateExcelWelderOperationReportAsync()
    {
        var welderOperationTimeDto = new WelderOperationTimeDto
        {
            WeldingPreparationTimeMinutes = 300,
            WorkTimeMinutes = 250,
            DowntimeMinutes = 170,
            AverageEstimation = 7.5
        };

        return await _excelWelderOperationReportService.GenerateReportAsync(welderOperationTimeDto);
    }
}
