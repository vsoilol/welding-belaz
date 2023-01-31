namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;

public class AssignProductToInspectorRequest
{
    public Guid ProductId { get; set; }
    
    public Guid InspectorId { get; set; }
}