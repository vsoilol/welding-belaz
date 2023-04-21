using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelSeamAmountReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.Extensions;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.FileApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ExcelSeamAmountReportController : ControllerBase
{
    private readonly IExcelSeamAmountReportService _excelSeamAmountReportService;

    public ExcelSeamAmountReportController(
        IExcelSeamAmountReportService excelSeamAmountReportService
    )
    {
        _excelSeamAmountReportService = excelSeamAmountReportService;
    }

    [HttpGet("byWorkshop")]
    public async Task<IActionResult> GenerateExcelSeamAmountReportByWorkshopAsync(
        [FromQuery] GenerateExcelSeamAmountReportByWorkshopRequest request
    )
    {
        var result =
            await _excelSeamAmountReportService.GenerateExcelSeamAmountReportByWorkshopAsync(
                request
            );
        return result.ToFile();
    }

    [HttpGet("byWelder")]
    public async Task<IActionResult> GenerateExcelSeamAmountReportByWelderAsync(
        [FromQuery] GenerateExcelSeamAmountReportByWelderRequest request
    )
    {
        var result = await _excelSeamAmountReportService.GenerateExcelSeamAmountReportByWelderAsync(
            request
        );
        return result.ToFile();
    }

    [HttpGet("byWorkplace")]
    public async Task<IActionResult> GenerateExcelSeamAmountReportByWorkplaceAsync(
        [FromQuery] GenerateExcelSeamAmountReportByWorkplaceRequest request
    )
    {
        var result =
            await _excelSeamAmountReportService.GenerateExcelSeamAmountReportByWorkplaceAsync(
                request
            );
        return result.ToFile();
    }

    [HttpGet("byProductionArea")]
    public async Task<IActionResult> GenerateExcelSeamAmountReportByProductionAreaAsync(
        [FromQuery] GenerateExcelSeamAmountReportByProductionAreaRequest request
    )
    {
        var result =
            await _excelSeamAmountReportService.GenerateExcelSeamAmountReportByProductionAreaAsync(
                request
            );
        return result.ToFile();
    }
}
