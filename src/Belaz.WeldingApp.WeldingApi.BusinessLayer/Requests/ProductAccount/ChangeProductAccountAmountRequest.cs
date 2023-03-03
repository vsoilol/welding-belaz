namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;

public class ChangeProductAccountAmountRequest
{
    public Guid Id { get; set; }

    public int Amount { get; set; }
}
