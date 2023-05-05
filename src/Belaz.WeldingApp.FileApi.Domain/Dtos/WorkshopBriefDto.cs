using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class WorkshopBriefDto : IMapFrom<Workshop>
{
    public string Name { get; set; } = null!;

    public int Number { get; set; }
}