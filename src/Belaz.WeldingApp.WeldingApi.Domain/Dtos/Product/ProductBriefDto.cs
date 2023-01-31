using Belaz.WeldingApp.WeldingApi.Domain.Mappings;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;

public class ProductBriefDto : IMapFrom<Entities.ProductInfo.Product>
{
    public Guid Id { get; set; }

    public string? Name { get; set; }

    public int Number { get; set; }

    public ProductType ProductType { get; set; }
}