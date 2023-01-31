using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;

public class WorkshopBriefDto : IMapFrom<Entities.Production.Workshop>
{
    public Guid Id { get; set; }

    public int Number { get; set; }

    public string Name { get; set; } = null!;
}