using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelDeviationReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.Extensions;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.FileApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ExcelDeviationReportController : ControllerBase
{
    private readonly IExcelDeviationReportService _excelDeviationReportService;

    public ExcelDeviationReportController(IExcelDeviationReportService excelDeviationReportService)
    {
        _excelDeviationReportService = excelDeviationReportService;
    }

    [HttpGet("byWorkshop")]
    public async Task<IActionResult> GenerateExcelDeviationReportByWorkshopAsync(
        [FromQuery] GenerateExcelDeviationReportByWorkshopRequest request
    )
    {
        var result = await _excelDeviationReportService.GenerateExcelDeviationReportByWorkshopAsync(
            request
        );
        return result.ToFile();
    }

    [HttpGet("byProductionArea")]
    public async Task<IActionResult> GenerateExcelDeviationReportByProductionAreaAsync(
        [FromQuery] GenerateExcelDeviationReportByProductionAreaRequest request
    )
    {
        var result =
            await _excelDeviationReportService.GenerateExcelDeviationReportByProductionAreaAsync(
                request
            );
        return result.ToFile();
    }

    [HttpGet("byWelder")]
    public async Task<IActionResult> GenerateExcelDeviationReportByWelderAsync(
        [FromQuery] GenerateExcelDeviationReportByWelderRequest request
    )
    {
        var result = await _excelDeviationReportService.GenerateExcelDeviationReportByWelderAsync(
            request
        );
        return result.ToFile();
    }

    [HttpGet("byWorkplace")]
    public async Task<IActionResult> GenerateExcelDeviationReportByWorkplaceAsync(
        [FromQuery] GenerateExcelDeviationReportByWorkplaceRequest request
    )
    {
        var result =
            await _excelDeviationReportService.GenerateExcelDeviationReportByWorkplaceAsync(
                request
            );
        return result.ToFile();
    }

    [HttpGet]
    public async Task<IActionResult> GenerateExcelDeviationReportAsync(
        [FromQuery] GenerateExcelDeviationReportRequest request
    )
    {
        var result = await _excelDeviationReportService.GenerateExcelDeviationReportAsync(request);
        return result.ToFile();
    }
}
