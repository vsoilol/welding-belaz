using Belaz.WeldingApp.RegistarApi.Domain.Entities.Production;
using Belaz.WeldingApp.RegistarApi.Domain.Mappings;

namespace Belaz.WeldingApp.RegistarApi.Domain.Dtos;

public class WorkshopDto : IMapFrom<Workshop>
{
    public Guid Id { get; set; }
    
    public string Name { get; set; } = null!;

    public int Number { get; set; }
}