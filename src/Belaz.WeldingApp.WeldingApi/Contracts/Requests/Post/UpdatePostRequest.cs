namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.Post;

public class UpdatePostRequest
{
    public Guid Id { get; set; }
    
    public int Number { get; set; }

    public Guid ProductionAreaId { get; set; }
}