namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentOperationAnalysisReport;

public class ExcelEquipmentOperationAnalysisReportByWorkshopRequest
    : ExcelEquipmentOperationAnalysisReportRequest
{
    public Guid WorkshopId { get; set; }
}
