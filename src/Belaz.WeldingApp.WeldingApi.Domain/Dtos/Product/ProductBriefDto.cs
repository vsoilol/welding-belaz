using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;

public class ProductBriefDto : IMapFrom<Belaz.WeldingApp.Common.Entities.ProductInfo.Product>
{
    public Guid Id { get; set; }

    public string? IdFromSystem { get; set; }

    public string? Name { get; set; }

    public string Number { get; set; } = null!;

    public ProductType ProductType { get; set; }
}
