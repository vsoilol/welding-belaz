namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccountTask;

public class ChangeDefectiveAmountRequest
{
    public Guid ProductAccountTaskId { get; set; }

    public Guid InspectorId { get; set; }

    public string? DefectiveReason { get; set; }

    public int DefectiveAmount { get; set; }
}