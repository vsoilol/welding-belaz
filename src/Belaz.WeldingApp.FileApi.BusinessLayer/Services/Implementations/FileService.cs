using Belaz.WeldingApp.FileApi.BusinessLayer.Helpers.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.SeamPassport;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Constants;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
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

    public FileService(ITaskRepository taskRepository, IWebHostEnvironment environment,
        IMarkEstimateService markEstimateService)
    {
        _taskRepository = taskRepository;
        _environment = environment;
        _markEstimateService = markEstimateService;
    }

    public async Task<DocumentDto> GenerateSeamPassportAsync()
    {
        var task = await _taskRepository.GetByIdAsync(Guid.Parse("5737c18a-5756-431e-819e-62280c7e2d5a"));

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
}