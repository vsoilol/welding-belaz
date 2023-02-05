namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;

public class AssignProductsToInspectorRequest
{
    public List<Guid> ProductIds { get; set; } = null!;
    
    public Guid InspectorId { get; set; }
}