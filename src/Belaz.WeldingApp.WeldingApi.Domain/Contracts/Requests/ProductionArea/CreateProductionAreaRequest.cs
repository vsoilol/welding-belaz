namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.ProductionArea;

public class CreateProductionAreaRequest
{
    public string Name { get; set; } = null!;

    public int Number { get; set; }
        
    public Guid WorkshopId { get; set; }
}