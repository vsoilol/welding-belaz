namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Workplace;

public class CreateWorkplaceRequest
{
    public int Number { get; set; }
        
    public Guid? PostId { get; set; }

    public Guid? ProductionAreaId { get; set; }
}