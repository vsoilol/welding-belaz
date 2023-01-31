using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;

public class ProductionAreaBriefDto : IMapFrom<Entities.Production.ProductionArea>
{
    public Guid Id { get; set; }
    
    public string? IdFromSystem { get; set; }

    public int Number { get; set; }

    public string Name { get; set; } = null!;
}