namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductionArea;

public class CreateProductionAreaRequest
{
    public string Name { get; set; } = null!;

    public int Number { get; set; }
        
    public Guid WorkshopId { get; set; }
}