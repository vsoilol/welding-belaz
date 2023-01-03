using Belaz.WeldingApp.WeldingApi.Contracts.Requests.WeldPassage;

namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.TechnologicalInstruction;

public class UpdateInstructionRequest
{
    public Guid Id { get; set; }
    
    public int Number { get; set; }

    public string Name { get; set; } = null!;

    public List<UpdateWeldPassageRequest> WeldPassages { get; set; } = null!;
}