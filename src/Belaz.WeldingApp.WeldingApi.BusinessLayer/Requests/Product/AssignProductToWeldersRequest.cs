namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;

public class AssignProductToWeldersRequest
{
    public Guid ProductId { get; set; }

    public List<Guid> WelderIds { get; set; } = null!;
}