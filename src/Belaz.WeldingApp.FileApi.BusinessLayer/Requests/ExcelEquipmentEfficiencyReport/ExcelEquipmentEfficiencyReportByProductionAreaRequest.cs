namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentEfficiencyReport;

public class ExcelEquipmentEfficiencyReportByProductionAreaRequest
    : ExcelEquipmentEfficiencyReportRequest
{
    public Guid ProductionAreaId { get; set; }
}
