namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests;

public class GenerateExcelEquipmentDowntimeReportRequest
{
    public Guid WeldingEquipmentId { get; set; }

    public string StartDate { get; set; } = null!;

    public string EndDate { get; set; } = null!;
}
