using Belaz.WeldingApp.WeldingApi.Domain.Mappings;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;

public class ProductBriefDto : IMapFrom<Entities.ProductInfo.Product>
{
    public Guid Id { get; set; }

    public string? IdFromSystem { get; set; }

    public string? Name { get; set; }

    public string Number { get; set; } = null!;

    public ProductType ProductType { get; set; }
}
