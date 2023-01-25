using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldPassage;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalInstruction;

public class UpdateInstructionRequest
{
    public Guid Id { get; set; }
    
    public int Number { get; set; }

    public string Name { get; set; } = null!;

    public List<UpdateWeldPassageRequest> WeldPassages { get; set; } = null!;
}