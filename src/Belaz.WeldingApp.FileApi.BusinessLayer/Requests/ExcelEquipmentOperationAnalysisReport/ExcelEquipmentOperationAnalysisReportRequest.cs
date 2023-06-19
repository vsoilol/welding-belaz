using Belaz.WeldingApp.FileApi.Domain.Enums;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentOperationAnalysisReport;

public class ExcelEquipmentOperationAnalysisReportRequest
{
    public string StartDate { get; set; } = null!;

    public string EndDate { get; set; } = null!;

    public CutType CutType { get; set; }
    
    public int? WorkingShiftNumber { get; set; }
}
