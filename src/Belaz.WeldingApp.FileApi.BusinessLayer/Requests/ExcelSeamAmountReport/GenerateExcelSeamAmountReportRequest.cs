namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelSeamAmountReport;

public abstract class GenerateExcelSeamAmountReportRequest
{
    public string StartDate { get; set; } = null!;

    public string EndDate { get; set; } = null!;
}
