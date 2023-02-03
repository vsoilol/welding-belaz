using Belaz.WeldingApp.FileApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.FileApi.BusinessLayer.Helpers.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.SeamPassport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using LanguageExt.Common;
using Microsoft.AspNetCore.Hosting;
using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;

public class FileService : IFileService
{
    private readonly ITaskRepository _taskRepository;
    private readonly IWebHostEnvironment _environment;
    private readonly IMarkEstimateService _markEstimateService;
    private readonly IValidationService _validationService;

    public FileService(ITaskRepository taskRepository, IWebHostEnvironment environment,
        IMarkEstimateService markEstimateService, IValidationService validationService)
    {
        _taskRepository = taskRepository;
        _environment = environment;
        _markEstimateService = markEstimateService;
        _validationService = validationService;
    }

    public async Task<DocumentDto> GenerateSeamPassportAsync()
    {
        var task = await _taskRepository.GetByIdAsync(Guid.Parse("cc61244a-3e7c-408f-bd2e-419e4bbb369f"));

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

    public async Task<Result<DocumentDto>> GenerateSeamPassportByTaskIdAsync(
        GenerateSeamPassportByTaskIdRequest request)
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