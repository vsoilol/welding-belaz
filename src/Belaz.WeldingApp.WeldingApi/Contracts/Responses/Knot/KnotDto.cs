﻿namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses.Knot;

public class KnotDto
{
    public string Name { get; set; }
        
    public int Number { get; set; }
    
    public Guid? ProductId { get; set; }

    public int? WorkplaceNumber { get; set; }
    
    public int ProductionAreaNumber { get; set; }
    
    public int WorkshopNumber { get; set; }
    
    
    public string TechnologicalProcessName { get; set; }
    
    public int TechnologicalProcessNumber { get; set; }
    
    public string TechnologicalInstructionName { get; set; }
    
    public int TechnologicalInstructionNumber { get; set; }
    
    public Guid TechnologicalProcessId { get; set; }
}