using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class WorkplaceBriefDto : IMapFrom<Workplace>
{
    public Guid Id { get; set; }
    
    public int Number { get; set; }
}