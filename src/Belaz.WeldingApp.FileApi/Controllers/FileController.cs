using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelDeviationReport;
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

    [HttpGet("deviationReport/byWorkshop")]
    public async Task<IActionResult> GetExcelDeviationReportByWorkshopAsync(
        [FromQuery] GenerateExcelDeviationReportByWorkshopRequest request
    )
    {
        var result = await _fileService.GenerateExcelDeviationReportByWorkshopAsync(request);
        return result.ToFile();
    }

    [HttpGet("deviationReport/byProductionArea")]
    public async Task<IActionResult> GetExcelDeviationReportByProductionAreaAsync(
        [FromQuery] GenerateExcelDeviationReportByProductionAreaRequest request
    )
    {
        var result = await _fileService.GenerateExcelDeviationReportByProductionAreaAsync(request);
        return result.ToFile();
    }

    [HttpGet("deviationReport/byWelder")]
    public async Task<IActionResult> GenerateExcelDeviationReportByWelderAsync(
        [FromQuery] GenerateExcelDeviationReportByWelderRequest request
    )
    {
        var result = await _fileService.GenerateExcelDeviationReportByWelderAsync(request);
        return result.ToFile();
    }

    [HttpGet("seamAmountReport")]
    public async Task<IActionResult> GenerateExcelSeamAmountReportAsync()
    {
        var result = await _fileService.GenerateExcelSeamAmountReportAsync();
        return result.ToFile();
    }

    [HttpGet("equipmentOperationTime")]
    public async Task<IActionResult> GenerateExcelEquipmentOperationTimeReportAsync()
    {
        var result = await _fileService.GenerateExcelEquipmentOperationTimeReportAsync();
        return result.ToFile();
    }
}
