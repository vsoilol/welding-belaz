using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;

public class TechnologicalInstructionDto : IMapFrom<Entities.TaskInfo.TechnologicalInstruction>
{
    public Guid Id { get; set; }

    public int Number { get; set; }

    public string Name { get; set; } = null!;

    public SeamDto Seam { get; set; } = null!;

    public List<WeldPassageDto> WeldPassages { get; set; } = null!;
}