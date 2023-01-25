namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductInfo;

public class AssignProductToMasterRequest
{
    public Guid ProductId { get; set; }
    
    public Guid MasterId { get; set; }
}