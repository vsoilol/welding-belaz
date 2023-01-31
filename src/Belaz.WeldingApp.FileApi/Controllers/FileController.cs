using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
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

    [HttpGet]
    public async Task<IActionResult> GetSeamPassportAsync()
    {
        var result = await _fileService.GenerateSeamPassportAsync();
        return File(result.Bytes, result.FileType, result.FileName);
    }
}