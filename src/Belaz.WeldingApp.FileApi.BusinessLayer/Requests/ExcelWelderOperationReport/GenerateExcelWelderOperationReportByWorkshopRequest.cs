namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelWelderOperationReport;

public class GenerateExcelWelderOperationReportByWorkshopRequest
    : GenerateExcelWelderOperationReportRequest
{
    public Guid WorkshopId { get; set; }
}
