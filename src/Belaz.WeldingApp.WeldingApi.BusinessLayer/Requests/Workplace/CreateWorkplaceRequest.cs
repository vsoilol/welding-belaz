using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Workplace;

public class CreateWorkplaceRequest : IMapTo<Belaz.WeldingApp.Common.Entities.Production.Workplace>
{
    public int Number { get; set; }

    public Guid? PostId { get; set; }

    public Guid? ProductionAreaId { get; set; }
}
