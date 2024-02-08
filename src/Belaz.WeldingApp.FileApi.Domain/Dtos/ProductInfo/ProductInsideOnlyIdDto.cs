using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;

public class ProductInsideOnlyIdDto : IMapFrom<ProductInside>
{
    public Guid MainProductId { get; set; }

    public Guid InsideProductId { get; set; }
}