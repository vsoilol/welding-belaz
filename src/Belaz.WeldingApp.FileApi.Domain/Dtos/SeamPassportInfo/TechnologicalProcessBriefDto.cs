using Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

public class TechnologicalProcessBriefDto : IMapFrom<TechnologicalProcess>
{
    public string Number { get; set; } = null!;

    public string Name { get; set; } = null!;
}