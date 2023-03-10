namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;

public class GenerateTasksRequest
{
    public string Date { get; set; } = null!;

    public Guid ProductionAreaId { get; set; }

    public Guid MasterId { get; set; }
}
