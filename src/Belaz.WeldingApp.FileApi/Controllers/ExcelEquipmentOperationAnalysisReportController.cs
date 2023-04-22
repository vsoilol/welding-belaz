using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentOperationAnalysisReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.Extensions;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.FileApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ExcelEquipmentOperationAnalysisReportController : ControllerBase
{
    private readonly IExcelEquipmentOperationAnalysisReportService _excelEquipmentOperationAnalysisReportService;

    public ExcelEquipmentOperationAnalysisReportController(
        IExcelEquipmentOperationAnalysisReportService excelEquipmentOperationAnalysisReportService
    )
    {
        _excelEquipmentOperationAnalysisReportService =
            excelEquipmentOperationAnalysisReportService;
    }

    [HttpGet]
    public async Task<IActionResult> GenerateExcelEquipmentOperationAnalysisReportAsync(
        [FromQuery] ExcelEquipmentOperationAnalysisReportRequest request
    )
    {
        var result =
            await _excelEquipmentOperationAnalysisReportService.GenerateExcelEquipmentOperationAnalysisReportAsync(
                request
            );
        return result.ToFile();
    }
}
