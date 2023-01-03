namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses;

public class SeamDto
{
    public int Number { get; set; }

    public ProductBriefDto Product { get; set; } = null!;
    
    public int? WorkplaceNumber { get; set; }
    
    public int ProductionAreaNumber { get; set; }
    
    public int WorkshopNumber { get; set; }

    public string TechnologicalProcessName { get; set; } = null!;
    
    public int TechnologicalProcessNumber { get; set; }
    
    public string TechnologicalInstructionName { get; set; } = null!;
    
    public int TechnologicalInstructionNumber { get; set; }
}