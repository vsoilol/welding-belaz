namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.Post;

public class UpdatePostRequest
{
    public Guid Id { get; set; }
    
    public int Number { get; set; }
    
    public string Name { get; set; } = null!;

    public Guid ProductionAreaId { get; set; }
}