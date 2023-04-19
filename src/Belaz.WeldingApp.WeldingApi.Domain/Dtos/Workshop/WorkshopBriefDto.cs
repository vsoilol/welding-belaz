using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;

public class WorkshopBriefDto : IMapFrom<Belaz.WeldingApp.Common.Entities.Production.Workshop>
{
    public Guid Id { get; set; }

    public string? IdFromSystem { get; set; }

    public int Number { get; set; }

    public string Name { get; set; } = null!;
}
