namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelWelderOperationReport;

public abstract class GenerateExcelWelderOperationReportRequest
{
    public string StartDate { get; set; } = null!;

    public string EndDate { get; set; } = null!;
}
