using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Mappings;

namespace Belaz.WeldingApp.RegistarApi.Domain.Dtos;

public class SeamDto : IMapFrom<Seam>
{
    public Guid Id { get; set; }

    public string Number { get; set; } = null!;

    public int Length { get; set; }

    public ProductionAreaDto ProductionArea { get; set; } = null!;

    public ProductDto Product { get; set; } = null!;

    public ProductDto? Knot { get; set; }

    public ProductDto? Detail { get; set; }
}
