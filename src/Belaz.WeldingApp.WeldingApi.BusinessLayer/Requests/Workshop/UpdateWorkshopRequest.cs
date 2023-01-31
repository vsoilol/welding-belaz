using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Workshop;

public class UpdateWorkshopRequest : IMapTo<Domain.Entities.Production.Workshop>
{
    public Guid Id { get; set; }

    public string Name { get; set; } = null!;

    public int Number { get; set; }
}