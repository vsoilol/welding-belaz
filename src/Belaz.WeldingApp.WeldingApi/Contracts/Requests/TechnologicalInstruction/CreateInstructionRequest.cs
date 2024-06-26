﻿using Belaz.WeldingApp.WeldingApi.Contracts.Requests.WeldPassage;

namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.TechnologicalInstruction;

public class CreateInstructionRequest
{
    public int Number { get; set; }

    public string Name { get; set; } = null!;
    
    public Guid SeamId { get; set; }
    
    public Guid TechnologicalProcessId { get; set; }

    public List<CreateWeldPassageRequest> WeldPassages { get; set; } = null!;
}