namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;

public class GetAllProductAccountsByDateRequest
{
    public string Date { get; set; } = null!;

    public Guid ProductionAreaId { get; set; }
}
