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
    
    public FileService(ITaskRepository taskRepository, IWebHostEnvironment environment)
    {
        _taskRepository = taskRepository;
        _environment = environment;
    }

    public async Task<DocumentDto> GenerateSeamPassportAsync()
    {
        var task = await _taskRepository.GetByIdAsync(Guid.Parse("8a52f206-26b3-49bb-a89d-a8b9ace29c58"));

        var fontsPath = Path.Combine(_environment.WebRootPath, $"fonts");;
        var document = new SeamPassportDocument(task, fontsPath);

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