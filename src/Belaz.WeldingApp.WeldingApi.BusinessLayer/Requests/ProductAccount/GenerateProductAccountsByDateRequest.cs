namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;

public class GenerateProductAccountsByDateRequest
{
    public string Date { get; set; } = null!;

    public string NewDate { get; set; } = null!;

    public Guid ProductionAreaId { get; set; }
}
