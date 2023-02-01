using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldPassageInstruction;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalInstruction;

public class CreateInstructionRequest : IMapTo<Domain.Entities.TechnologicalProcessInfo.TechnologicalInstruction>
{
    public int Number { get; set; }

    public string Name { get; set; } = null!;
    
    public Guid SeamId { get; set; }
    
    public Guid TechnologicalProcessId { get; set; }

    public List<CreateWeldPassageInstructionRequest> WeldPassages { get; set; } = null!;
}