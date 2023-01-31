namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;

public class AssignProductToMasterRequest
{
    public Guid ProductId { get; set; }
    
    public Guid MasterId { get; set; }
}