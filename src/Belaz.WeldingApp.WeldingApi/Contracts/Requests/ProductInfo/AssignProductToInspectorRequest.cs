namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.ProductInfo;

public class AssignProductToInspectorRequest
{
    public Guid ProductId { get; set; }
    
    public Guid InspectorId { get; set; }
}