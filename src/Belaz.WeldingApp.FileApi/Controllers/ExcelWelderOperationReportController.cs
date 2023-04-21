using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelWelderOperationReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.Extensions;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.FileApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ExcelWelderOperationReportController : ControllerBase
{
    private readonly IExcelWelderOperationReportService _excelWelderOperationReportService;

    public ExcelWelderOperationReportController(
        IExcelWelderOperationReportService excelWelderOperationReportService
    )
    {
        _excelWelderOperationReportService = excelWelderOperationReportService;
    }

    [HttpGet("byWelder")]
    public async Task<IActionResult> GenerateExcelWelderOperationReportByWelderAsync(
        [FromQuery] GenerateExcelWelderOperationReportByWelderRequest request
    )
    {
        var result =
            await _excelWelderOperationReportService.GenerateExcelWelderOperationReportByWelderAsync(
                request
            );
        return result.ToFile();
    }

    [HttpGet("byWorkplace")]
    public async Task<IActionResult> GenerateExcelWelderOperationReportByWorkplaceAsync(
        [FromQuery] GenerateExcelWelderOperationReportByWorkplaceRequest request
    )
    {
        var result =
            await _excelWelderOperationReportService.GenerateExcelWelderOperationReportByWorkplaceAsync(
                request
            );
        return result.ToFile();
    }

    [HttpGet("byProductionArea")]
    public async Task<IActionResult> GenerateExcelWelderOperationReportByProductionAreaAsync(
        [FromQuery] GenerateExcelWelderOperationReportByProductionAreaRequest request
    )
    {
        var result =
            await _excelWelderOperationReportService.GenerateExcelWelderOperationReportByProductionAreaAsync(
                request
            );
        return result.ToFile();
    }

    [HttpGet("byWorkshop")]
    public async Task<IActionResult> GenerateExcelWelderOperationReportByWorkshopAsync(
        [FromQuery] GenerateExcelWelderOperationReportByWorkshopRequest request
    )
    {
        var result =
            await _excelWelderOperationReportService.GenerateExcelWelderOperationReportByWorkshopAsync(
                request
            );
        return result.ToFile();
    }

    [HttpGet]
    public async Task<IActionResult> GenerateExcelWelderOperationReportAsync(
        [FromQuery] GenerateExcelWelderOperationReportRequest request
    )
    {
        var result =
            await _excelWelderOperationReportService.GenerateExcelWelderOperationReportAsync(
                request
            );
        return result.ToFile();
    }
}
