namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.Workplace;

public class CreateWorkplaceRequest
{
    public int Number { get; set; }
        
    public Guid? PostId { get; set; }

    public Guid? ProductionAreaId { get; set; }
}