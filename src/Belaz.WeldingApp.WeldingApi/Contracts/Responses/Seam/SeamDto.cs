namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses.Seam;

public class SeamDto
{
    public int Number { get; set; }
    
    public Guid? ProductId { get; set; }
    
    public Guid? DetailId { get; set; }
    
    public Guid? KnotId { get; set; }
    
    public int? WorkplaceNumber { get; set; }
    
    public int ProductionAreaNumber { get; set; }
    
    public int WorkshopNumber { get; set; }
    
    public string TechnologicalProcessName { get; set; }
    
    public int TechnologicalProcessNumber { get; set; }
    
    public string TechnologicalInstructionName { get; set; }
    
    public int TechnologicalInstructionNumber { get; set; }
    
    public Guid TechnologicalProcessId { get; set; }
}