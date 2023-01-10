namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.Workplace;

public class UpdateWorkplaceRequest
{
    public Guid Id { get; set; }
    
    public int Number { get; set; }
        
    public Guid? PostId { get; set; }

    public Guid? ProductionAreaId { get; set; }
}