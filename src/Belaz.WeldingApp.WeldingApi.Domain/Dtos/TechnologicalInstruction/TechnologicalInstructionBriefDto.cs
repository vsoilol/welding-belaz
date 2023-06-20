using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;

public class TechnologicalInstructionBriefDto
    : IMapFrom<Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo.TechnologicalInstruction>
{
    public string Name { get; set; } = null!;

    public string Number { get; set; } = null!;
}
