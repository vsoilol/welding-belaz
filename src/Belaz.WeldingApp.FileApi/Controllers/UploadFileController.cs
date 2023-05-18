using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.Extensions;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.FileApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class UploadFileController : ControllerBase
{
    private readonly IUploadFileService _uploadFileService;

    public UploadFileController(IUploadFileService uploadFileService)
    {
        _uploadFileService = uploadFileService;
    }

    [HttpPost("product-account")]
    public async Task<IActionResult> UploadProductAccountDataAsync([FromForm] IFormFile file)
    {
        var result = await _uploadFileService.UploadProductAccountDataAsync(file);
        return result.ToEmptyOk();
    }
}