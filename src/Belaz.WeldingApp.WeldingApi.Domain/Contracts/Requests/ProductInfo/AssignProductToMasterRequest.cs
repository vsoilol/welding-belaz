namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.ProductInfo;

public class AssignProductToMasterRequest
{
    public Guid ProductId { get; set; }
    
    public Guid MasterId { get; set; }
}