namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelDeviationReport;

public class GenerateExcelDeviationReportByWorkshopRequest : GenerateExcelDeviationReportRequest
{
    public Guid WorkshopId { get; set; }
}
