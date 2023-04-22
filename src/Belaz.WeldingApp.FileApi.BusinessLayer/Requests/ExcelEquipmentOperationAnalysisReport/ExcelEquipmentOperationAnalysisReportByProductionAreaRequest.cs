namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentOperationAnalysisReport;

public class ExcelEquipmentOperationAnalysisReportByProductionAreaRequest
    : ExcelEquipmentOperationAnalysisReportRequest
{
    public Guid ProductionAreaId { get; set; }
}
