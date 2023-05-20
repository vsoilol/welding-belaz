using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class ProductionAreaBriefDto : IMapFrom<ProductionArea>
{
    public Guid Id { get; set; }
    
    public string Name { get; set; } = null!;

    public int Number { get; set; }
}