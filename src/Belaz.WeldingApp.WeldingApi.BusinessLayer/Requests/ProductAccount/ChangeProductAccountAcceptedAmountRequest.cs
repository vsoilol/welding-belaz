namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;

public class ChangeProductAccountAcceptedAmountRequest
{
    public Guid Id { get; set; }

    public int Amount { get; set; }

    public Guid InspectorId { get; set; }
}
