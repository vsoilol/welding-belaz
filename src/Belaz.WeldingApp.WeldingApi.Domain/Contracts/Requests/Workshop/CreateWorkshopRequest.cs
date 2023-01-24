namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.Workshop;

public class CreateWorkshopRequest
{
    public string Name { get; set; } = null!;

    public int Number { get; set; }
}