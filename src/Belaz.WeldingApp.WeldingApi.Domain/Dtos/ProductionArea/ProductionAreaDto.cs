using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;

public class ProductionAreaDto : IMapFrom<Entities.Production.ProductionArea>
{
    public Guid Id { get; set; }

    public string Name { get; set; } = null!;

    public int Number { get; set; }

    public WorkshopBriefDto Workshop { get; set; } = null!;
}