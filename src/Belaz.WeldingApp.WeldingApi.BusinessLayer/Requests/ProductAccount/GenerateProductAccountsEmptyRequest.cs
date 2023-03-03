namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;

public class GenerateProductAccountsEmptyRequest
{
    public string NewDate { get; set; } = null!;

    public Guid ProductionAreaId { get; set; }
}
