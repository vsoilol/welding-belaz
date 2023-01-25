using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldPassage;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalInstruction;

public class CreateInstructionRequest
{
    public int Number { get; set; }

    public string Name { get; set; } = null!;
    
    public Guid SeamId { get; set; }
    
    public Guid TechnologicalProcessId { get; set; }

    public List<CreateWeldPassageRequest> WeldPassages { get; set; } = null!;
}