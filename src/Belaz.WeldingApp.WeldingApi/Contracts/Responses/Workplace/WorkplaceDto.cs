namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses.Workplace;

public class WorkplaceDto
{
    public Guid Id { get; set; }
    
    public int Number { get; set; }
        
    public Guid? PostId { get; set; }

    public Guid? ProductionAreaId { get; set; }
}