using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;

public class CreateProductRequest
{
    public ProductType Type { get; set; }

    public CreateProductWithoutTypeRequest Request { get; set; } = null!;
}