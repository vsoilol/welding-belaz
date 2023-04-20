using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;

public class WorkshopDto : IMapFrom<Belaz.WeldingApp.Common.Entities.Production.Workshop>
{
    public Guid Id { get; set; }

    public string? IdFromSystem { get; set; }

    public string Name { get; set; } = null!;

    public int Number { get; set; }

    public List<ProductionAreaBriefDto> ProductionAreas { get; set; } = null!;
}
