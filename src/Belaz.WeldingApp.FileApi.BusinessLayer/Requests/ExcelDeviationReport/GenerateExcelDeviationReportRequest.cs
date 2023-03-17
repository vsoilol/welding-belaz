namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelDeviationReport;

public abstract class GenerateExcelDeviationReportRequest
{
    public Guid ProductId { get; set; }

    public Guid? SeamId { get; set; }

    public string StartDate { get; set; } = null!;

    public string EndDate { get; set; } = null!;
}
