using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workplace;

public class WorkplaceBriefDto : IMapFrom<Entities.Production.Workplace>
{
    public Guid Id { get; set; }

    public int Number { get; set; }
}