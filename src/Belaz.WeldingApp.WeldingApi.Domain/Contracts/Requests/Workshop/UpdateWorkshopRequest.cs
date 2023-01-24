namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.Workshop;

public class UpdateWorkshopRequest
{
    public Guid Id { get; set; }
    
    public string Name { get; set; } = null!;

    public int Number { get; set; }
}