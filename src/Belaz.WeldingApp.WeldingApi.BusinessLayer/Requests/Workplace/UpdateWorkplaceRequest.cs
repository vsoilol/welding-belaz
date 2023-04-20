using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Workplace;

public class UpdateWorkplaceRequest : IMapTo<Belaz.WeldingApp.Common.Entities.Production.Workplace>
{
    public Guid Id { get; set; }

    public int Number { get; set; }

    public Guid? PostId { get; set; }

    public Guid? ProductionAreaId { get; set; }
}
