using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workplace;

public class WorkplaceBriefDto : IMapFrom<Belaz.WeldingApp.Common.Entities.Production.Workplace>
{
    public Guid Id { get; set; }

    public string? IdFromSystem { get; set; }

    public int Number { get; set; }
}
