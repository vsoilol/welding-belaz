using Belaz.WeldingApp.FileApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class ProductBriefDto : IMapFrom<Product>
{
    public string? Name { get; set; }

    public int Number { get; set; }

    public ProductType ProductType { get; set; }
}