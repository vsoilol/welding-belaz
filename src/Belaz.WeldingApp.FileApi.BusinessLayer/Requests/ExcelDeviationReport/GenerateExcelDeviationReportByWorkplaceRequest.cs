namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelDeviationReport;

public class GenerateExcelDeviationReportByWorkplaceRequest : GenerateExcelDeviationReportRequest
{
    public Guid WorkplaceId { get; set; }
}
