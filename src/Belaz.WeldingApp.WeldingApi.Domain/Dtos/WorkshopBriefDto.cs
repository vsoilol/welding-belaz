using Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos;

public class WorkshopBriefDto : IMapFrom<Workshop>
{
    public Guid Id { get; set; }

    public int Number { get; set; }

    public string Name { get; set; } = null!;
}