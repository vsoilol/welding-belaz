namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;

public class ChangeDefectiveAmountRequest
{
    public Guid ProductAccountId { get; set; }

    public Guid InspectorId { get; set; }

    public string? DefectiveReason { get; set; }

    public int DefectiveAmount { get; set; }
}