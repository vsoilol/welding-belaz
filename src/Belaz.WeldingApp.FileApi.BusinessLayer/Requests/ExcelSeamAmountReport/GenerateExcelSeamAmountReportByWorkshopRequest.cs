namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelSeamAmountReport;

public class GenerateExcelSeamAmountReportByWorkshopRequest : GenerateExcelSeamAmountReportRequest
{
    public Guid WorkshopId { get; set; }
}
