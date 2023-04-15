namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelSeamAmountReport;

public class GenerateExcelSeamAmountReportByProductionAreaRequest
    : GenerateExcelSeamAmountReportRequest
{
    public Guid ProductionAreaId { get; set; }
}
