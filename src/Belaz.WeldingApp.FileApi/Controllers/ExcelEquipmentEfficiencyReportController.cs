using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentEfficiencyReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.Extensions;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.FileApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ExcelEquipmentEfficiencyReportController : ControllerBase
{
    private readonly IExcelEquipmentEfficiencyReportService _excelEquipmentEfficiencyReportService;

    public ExcelEquipmentEfficiencyReportController(
        IExcelEquipmentEfficiencyReportService excelEquipmentEfficiencyReportService
    )
    {
        _excelEquipmentEfficiencyReportService = excelEquipmentEfficiencyReportService;
    }

    [HttpGet]
    public async Task<IActionResult> GenerateExcelEquipmentEfficiencyReportAsync(
        [FromQuery] ExcelEquipmentEfficiencyReportRequest request
    )
    {
        var result =
            await _excelEquipmentEfficiencyReportService.GenerateExcelEquipmentEfficiencyReportAsync(
                request
            );
        return result.ToFile();
    }

    [HttpGet("byWorkplace")]
    public async Task<IActionResult> GenerateExcelEquipmentEfficiencyReportByWorkplaceAsync(
        [FromQuery] ExcelEquipmentEfficiencyReportByWorkplaceRequest request
    )
    {
        var result =
            await _excelEquipmentEfficiencyReportService.GenerateExcelEquipmentEfficiencyReportByWorkplaceAsync(
                request
            );
        return result.ToFile();
    }

    [HttpGet("byWorkshop")]
    public async Task<IActionResult> GenerateExcelEquipmentEfficiencyReportByWorkshopAsync(
        [FromQuery] ExcelEquipmentEfficiencyReportByWorkshopRequest request
    )
    {
        var result =
            await _excelEquipmentEfficiencyReportService.GenerateExcelEquipmentEfficiencyReportByWorkshopAsync(
                request
            );
        return result.ToFile();
    }

    [HttpGet("byProductionArea")]
    public async Task<IActionResult> GenerateExcelEquipmentEfficiencyReportByProductionAreaAsync(
        [FromQuery] ExcelEquipmentEfficiencyReportByProductionAreaRequest request
    )
    {
        var result =
            await _excelEquipmentEfficiencyReportService.GenerateExcelEquipmentEfficiencyReportByProductionAreaAsync(
                request
            );
        return result.ToFile();
    }
}
