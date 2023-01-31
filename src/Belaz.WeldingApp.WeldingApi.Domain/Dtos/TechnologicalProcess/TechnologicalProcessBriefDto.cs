using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;

public class TechnologicalProcessBriefDto : IMapFrom<Entities.TaskInfo.TechnologicalProcess>
{
    public Guid Id { get; set; }
    
    public string? IdFromSystem { get; set; }

    public string Name { get; set; } = null!;

    public int Number { get; set; }
}