using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;

public class GetAllProductsByWelderIdRequest
{
    public Guid WelderId { get; set; }
    
    public ProductType Type { get; set; }
}