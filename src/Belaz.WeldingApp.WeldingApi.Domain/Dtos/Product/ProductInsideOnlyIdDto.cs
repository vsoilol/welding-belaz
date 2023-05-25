using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;

public class ProductInsideOnlyIdDto : IMapFrom<Common.Entities.ProductInfo.ProductInside>
{
    public Guid MainProductId { get; set; }

    public Guid InsideProductId { get; set; }
}