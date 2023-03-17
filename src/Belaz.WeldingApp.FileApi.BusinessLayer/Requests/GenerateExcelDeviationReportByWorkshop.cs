namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests;

public class GenerateExcelDeviationReportByWorkshopRequest
{
    public Guid WorkshopId { get; set; }

    public string StartDate { get; set; } = null!;

    public string EndDate { get; set; } = null!;
}
