using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;

public class ProductBriefDto : IMapFrom<Product>
{
    public ProductType ProductType { get; set; }
    
    public string Name { get; set; } = null!;

    public string Number { get; set; } = null!;
}