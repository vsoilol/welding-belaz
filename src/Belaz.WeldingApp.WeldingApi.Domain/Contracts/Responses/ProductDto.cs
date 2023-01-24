using Belaz.WeldingApp.WeldingApi.Domain.Contracts.Responses.Production;

namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Responses;

public class ProductDto
{
    public Guid Id { get; set; }

    public string? Name { get; set; }

    public int Number { get; set; }

    public ProductionBriefDto? Workplace { get; set; }

    public ProductionWithNameDto ProductionArea { get; set; } = null!;

    public ProductionWithNameDto Workshop { get; set; } = null!;

    public TechnologicalProcessBriefDto TechnologicalProcess { get; set; } = null!;

    public List<ProductBriefDto> InsideProducts { get; set; } = null!;

    public List<SeamBriefDto> Seams { get; set; } = null!;
}