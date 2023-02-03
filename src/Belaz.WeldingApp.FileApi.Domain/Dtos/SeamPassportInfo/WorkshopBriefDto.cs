using Belaz.WeldingApp.FileApi.Domain.Entities.Production;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

public class WorkshopBriefDto : IMapFrom<Workshop>
{
    public int Number { get; set; }

    public string Name { get; set; } = null!;
}