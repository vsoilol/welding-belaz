using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Workshop;

public class CreateWorkshopRequest : IMapTo<Belaz.WeldingApp.Common.Entities.Production.Workshop>
{
    public string Name { get; set; } = null!;

    public int Number { get; set; }
}
