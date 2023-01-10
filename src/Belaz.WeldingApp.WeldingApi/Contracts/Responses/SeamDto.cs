using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Production;

namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses;

public class SeamDto
{
    public Guid Id { get; set; }

    public int Number { get; set; }

    public ProductBriefDto Product { get; set; } = null!;

    public ProductionBriefDto? Workplace { get; set; }

    public ProductionWithNameDto ProductionArea { get; set; } = null!;

    public ProductionWithNameDto Workshop { get; set; } = null!;

    public TechnologicalProcessBriefDto TechnologicalProcess { get; set; } = null!;

    public TechnologicalInstructionBriefDto TechnologicalInstruction { get; set; } = null!;
}