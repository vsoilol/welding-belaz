using Belaz.WeldingApp.FileApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class TechnologicalInstructionBriefDto : IMapFrom<TechnologicalInstruction>
{
    public int Number { get; set; }

    public string Name { get; set; } = null!;

    public List<WeldPassageDto> WeldPassages { get; set; } = null!;
}