namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelWelderOperationReport;

public class GenerateExcelWelderOperationReportByWorkplaceRequest
    : GenerateExcelWelderOperationReportRequest
{
    public Guid WorkplaceId { get; set; }
}
