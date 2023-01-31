using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;

public class GetAllByTaskStatusRequest
{
    public ProductStatus Status { get; set; }
    
    public ProductType Type { get; set; }
}