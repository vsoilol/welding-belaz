namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentEfficiencyReport;

public class ExcelEquipmentEfficiencyReportByWorkshopRequest : ExcelEquipmentEfficiencyReportRequest
{
    public Guid WorkshopId { get; set; }
}
