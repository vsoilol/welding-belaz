namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests;

public class GenerateExcelEquipmentOperationTimeReportRequest
{
    public Guid WeldingEquipmentId { get; set; }

    public string StartDate { get; set; } = null!;

    public string EndDate { get; set; } = null!;

    public bool WithBreak { get; set; }
}
