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

    [HttpGet("seamPassport")]
    public async Task<IActionResult> GetSeamPassportAsync([FromQuery] GenerateSeamPassportByTaskIdRequest request)
    {
        var result = await _fileService.GenerateSeamPassportByTaskIdAsync(request);

        return result.ToFile();
    }

    [HttpGet("based-seam-passport")]
    public async Task<IActionResult> GenerateBasedSeamPassportAsync(
        [FromQuery] GenerateBasedSeamPassportByTaskIdRequest request)
    {
        var result = await _fileService.GenerateBasedSeamPassportByTaskIdAsync(request);

        return result.ToFile();
    }

    [HttpGet("product-account-report")]
    public async Task<IActionResult> GenerateProductAccountInfoExcelFileAsync()
    {
        var result = await _fileService.GenerateProductAccountInfoExcelFileAsync();

        return result.ToFile();
    }
}