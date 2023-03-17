namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests;

public class GenerateExcelDeviationReportByWorkshopRequest
{
    /// <summary>
    /// Id узла, детали или изделия
    /// </summary>
    public Guid ProductId { get; set; }

    public Guid? SeamId { get; set; }

    public Guid WorkshopId { get; set; }

    public string StartDate { get; set; } = null!;

    public string EndDate { get; set; } = null!;
}
