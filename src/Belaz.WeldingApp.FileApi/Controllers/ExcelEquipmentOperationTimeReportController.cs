using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.Extensions;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.FileApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ExcelEquipmentOperationTimeReportController : ControllerBase
{
    private readonly IExcelEquipmentOperationTimeReportService _excelEquipmentOperationTimeReportService;

    public ExcelEquipmentOperationTimeReportController(
        IExcelEquipmentOperationTimeReportService excelEquipmentOperationTimeReportService
    )
    {
        _excelEquipmentOperationTimeReportService = excelEquipmentOperationTimeReportService;
    }

    [HttpGet]
    public async Task<IActionResult> GenerateExcelEquipmentOperationTimeReportAsync(
        [FromQuery] GenerateExcelEquipmentOperationTimeReportRequest request
    )
    {
        var result =
            await _excelEquipmentOperationTimeReportService.GenerateExcelEquipmentOperationTimeReportAsync(
                request
            );
        return result.ToFile();
    }
}
