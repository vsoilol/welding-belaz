using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.Extensions;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.FileApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class FileController : ControllerBase
{
    private readonly IFileService _fileService;

    public FileController(IFileService fileService)
    {
        _fileService = fileService;
    }

    [HttpGet("seamPassport/{taskId}")]
    public async Task<IActionResult> GetSeamPassportAsync([FromRoute] Guid taskId)
    {
        var result = await _fileService.GenerateSeamPassportByTaskIdAsync(
            new GenerateSeamPassportByTaskIdRequest { TaskId = taskId }
        );

        return result.ToFile();
    }

    [HttpGet("excelChart")]
    public async Task<IActionResult> GetExcelChartAsync()
    {
        var result = await _fileService.GenerateExcelChartAsync();
        return result.ToFile();
    }
}
