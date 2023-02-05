namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;

public class AssignProductsToMasterRequest
{
    public List<Guid> ProductIds { get; set; } = null!;
    
    public Guid MasterId { get; set; }
}