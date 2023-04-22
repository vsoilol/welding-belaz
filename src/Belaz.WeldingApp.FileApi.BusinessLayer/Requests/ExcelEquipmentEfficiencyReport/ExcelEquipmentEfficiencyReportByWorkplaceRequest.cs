namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentEfficiencyReport;

public class ExcelEquipmentEfficiencyReportByWorkplaceRequest
    : ExcelEquipmentEfficiencyReportRequest
{
    public Guid WorkplaceId { get; set; }
}
