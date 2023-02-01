using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;

public class TechnologicalInstructionBriefDto : IMapFrom<Entities.TechnologicalProcessInfo.TechnologicalInstruction>
{
    public string Name { get; set; } = null!;

    public int Number { get; set; }
}