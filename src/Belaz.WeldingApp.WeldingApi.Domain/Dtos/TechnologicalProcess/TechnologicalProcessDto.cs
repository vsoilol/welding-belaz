using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;

public class TechnologicalProcessDto : IMapFrom<Entities.TechnologicalProcessInfo.TechnologicalProcess>
{
    public Guid Id { get; set; }
    
    public string? IdFromSystem { get; set; }

    public int Number { get; set; }

    public string Name { get; set; } = null!;

    public string PdmSystemFileLink { get; set; } = null!;

    public List<TechnologicalInstructionDto> TechnologicalInstructions { get; set; } = null!;
}