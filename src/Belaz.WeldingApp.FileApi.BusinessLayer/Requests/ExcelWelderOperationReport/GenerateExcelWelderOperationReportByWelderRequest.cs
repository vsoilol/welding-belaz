namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelWelderOperationReport;

public class GenerateExcelWelderOperationReportByWelderRequest
    : GenerateExcelWelderOperationReportRequest
{
    public Guid WelderId { get; set; }
}
