namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelDeviationReport;

public class GenerateExcelDeviationReportByWelderRequest : GenerateExcelDeviationReportRequest
{
    public Guid WelderId { get; set; }
}
