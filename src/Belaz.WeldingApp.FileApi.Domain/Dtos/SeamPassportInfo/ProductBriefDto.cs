using Belaz.WeldingApp.FileApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

public class ProductBriefDto : IMapFrom<Product>
{
    public string? Name { get; set; }

    public string Number { get; set; } = null!;

    public ProductType ProductType { get; set; }
}