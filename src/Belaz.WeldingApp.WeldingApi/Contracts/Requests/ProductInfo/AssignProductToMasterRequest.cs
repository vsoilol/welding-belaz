namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.ProductInfo;

public class AssignProductToMasterRequest
{
    public Guid ProductId { get; set; }
    
    public Guid MasterId { get; set; }
}