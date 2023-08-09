using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.Extensions;
using LanguageExt;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.FileApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class UploadFileController : ControllerBase
{
    private readonly IUploadFileService _uploadFileService;
    private readonly IUploadProductAccountFileService _productAccountFileService;

    public UploadFileController(IUploadFileService uploadFileService,
        IUploadProductAccountFileService productAccountFileService)
    {
        _uploadFileService = uploadFileService;
        _productAccountFileService = productAccountFileService;
    }

    [HttpPost("product-account")]
    public async Task<IActionResult> UploadProductAccountDataAsync([FromForm] UploadProductAccountDataRequest request)
    {
        var result = await _productAccountFileService.UploadProductAccountDataDbfAsync(request);
        return result.ToEmptyOk();
    }

    [HttpPost("users")]
    public async Task<ActionResult<Unit>> UploadUsersDataAsync([FromForm] IFormFile file)
    {
        var result = await _uploadFileService.UploadUsersDataAsync(file);
        return result.ToOk();
    }
}