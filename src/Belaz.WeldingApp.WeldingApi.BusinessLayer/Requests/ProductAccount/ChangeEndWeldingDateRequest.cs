namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;

public class ChangeEndWeldingDateRequest
{
    public Guid ProductAccountId { get; set; }

    public string? WeldingEndDate { get; set; }
}