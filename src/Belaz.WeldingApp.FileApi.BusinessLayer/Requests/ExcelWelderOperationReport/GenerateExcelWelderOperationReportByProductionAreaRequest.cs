namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelWelderOperationReport;

public class GenerateExcelWelderOperationReportByProductionAreaRequest
    : GenerateExcelWelderOperationReportRequest
{
    public Guid ProductionAreaId { get; set; }
}
