using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;

public class UpdateProductRequest
{
    public ProductType Type { get; set; }

    public UpdateProductWithoutTypeRequest Request { get; set; } = null!;
}