namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;

public class EditProductAccountRequest
{
    public Guid ProductAccountId { get; set; }

    public List<string> SequenceNumbers { get; set; } = null!;

    public int AmountFromPlan { get; set; }
}