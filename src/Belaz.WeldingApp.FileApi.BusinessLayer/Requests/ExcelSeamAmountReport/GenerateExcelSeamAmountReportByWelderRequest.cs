namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelSeamAmountReport;

public class GenerateExcelSeamAmountReportByWelderRequest : GenerateExcelSeamAmountReportRequest
{
    public Guid WelderId { get; set; }
}
