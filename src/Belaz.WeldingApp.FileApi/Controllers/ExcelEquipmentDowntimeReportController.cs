using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.Extensions;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.FileApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ExcelEquipmentDowntimeReportController : ControllerBase
{
    private readonly IExcelEquipmentDowntimeReportService _excelEquipmentDowntimeReportService;

    public ExcelEquipmentDowntimeReportController(
        IExcelEquipmentDowntimeReportService excelEquipmentDowntimeReportService
    )
    {
        _excelEquipmentDowntimeReportService = excelEquipmentDowntimeReportService;
    }

    [HttpGet]
    public async Task<IActionResult> GenerateExcelEquipmentDowntimeReportAsync(
        [FromQuery] GenerateExcelEquipmentDowntimeReportRequest request
    )
    {
        var result =
            await _excelEquipmentDowntimeReportService.GenerateExcelEquipmentDowntimeReportAsync(
                request
            );
        return result.ToFile();
    }
}
