namespace Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;

public class ProductStructureDto
{
    public ProductBriefDto Product { get; set; } = null!;

    public ProductBriefDto? Knot { get; set; }

    public ProductBriefDto? Detail { get; set; }
}