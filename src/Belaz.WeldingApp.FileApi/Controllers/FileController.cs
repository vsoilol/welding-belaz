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

    [HttpGet("equipmentDowntime")]
    public async Task<IActionResult> GenerateExcelEquipmentDowntimeReportAsync()
    {
        var result = await _fileService.GenerateExcelEquipmentDowntimeReportAsync();
        return result.ToFile();
    }

    [HttpGet("equipmentOperationAnalysis")]
    public async Task<IActionResult> GenerateExcelEquipmentOperationAnalysisReportAsync()
    {
        var result = await _fileService.GenerateExcelEquipmentOperationAnalysisReportAsync();
        return result.ToFile();
    }

    [HttpGet("welderOperationReport")]
    public async Task<IActionResult> GenerateExcelWelderOperationReportAsync()
    {
        var result = await _fileService.GenerateExcelWelderOperationReportAsync();
        return result.ToFile();
    }

    [HttpGet("equipmentEfficiencyReport")]
    public async Task<IActionResult> GenerateExcelEquipmentEfficiencyReportAsync()
    {
        var result = await _fileService.GenerateExcelEquipmentEfficiencyReportAsync();
        return result.ToFile();
    }
}
