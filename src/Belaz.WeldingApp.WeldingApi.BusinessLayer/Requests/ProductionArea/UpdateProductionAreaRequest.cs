using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductionArea;

public class UpdateProductionAreaRequest : IMapTo<Domain.Entities.Production.ProductionArea>
{
    public Guid Id { get; set; }

    public string Name { get; set; } = null!;

    public int Number { get; set; }

    public Guid WorkshopId { get; set; }
}