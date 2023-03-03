namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;

public class AssignProductAccountToWeldersRequest
{
    public Guid ProductAccountId { get; set; }

    public List<Guid> WelderIds { get; set; } = null!;
}
