namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelSeamAmountReport;

public class GenerateExcelSeamAmountReportByWorkplaceRequest : GenerateExcelSeamAmountReportRequest
{
    public Guid WorkplaceId { get; set; }
}
