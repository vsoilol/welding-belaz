namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses;

public class SeamDto
{
    public Guid Id { get; set; }

    public int Number { get; set; }

    public ProductBriefDto Product { get; set; } = null!;

    public int? WorkplaceNumber { get; set; }
    
    public int ProductionAreaNumber { get; set; }
    
    public int WorkshopNumber { get; set; }

    public TechnologicalProcessBriefDto TechnologicalProcess { get; set; } = null!;

    public TechnologicalInstructionBriefDto TechnologicalInstruction { get; set; } = null!;
}