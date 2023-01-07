namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses.Post;

public class PostDto
{
    public Guid Id { get; set; }
    
    public int Number { get; set; }

    public Guid ProductionAreaId { get; set; }
}