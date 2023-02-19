using Belaz.WeldingApp.RegistarApi.Domain.Entities.Production;
using Belaz.WeldingApp.RegistarApi.Domain.Mappings;

namespace Belaz.WeldingApp.RegistarApi.Domain.Dtos;

public class WorkplaceDto : IMapFrom<Workplace>
{
    public Guid Id { get; set; }
    
    public int Number { get; set; }
}