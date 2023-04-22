using Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

public class TechnologicalInstructionBriefDto : IMapFrom<TechnologicalInstruction>
{
    public int Number { get; set; }

    public string Name { get; set; } = null!;

    public List<WeldPassageInstructionDto> WeldPassageInstructions { get; set; } = null!;
}
