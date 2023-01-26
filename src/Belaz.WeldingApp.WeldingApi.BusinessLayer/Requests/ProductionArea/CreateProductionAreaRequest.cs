using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductionArea;

public class CreateProductionAreaRequest : IMapTo<Domain.Entities.Production.ProductionArea>
{
    public string Name { get; set; } = null!;

    public int Number { get; set; }
        
    public Guid WorkshopId { get; set; }
}