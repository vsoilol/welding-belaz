using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Production;

namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses.Post;

public class PostDto
{
    public Guid Id { get; set; }
    
    public int Number { get; set; }

    public string Name { get; set; } = null!;

    public ProductionWithNameDto ProductionArea { get; set; } = null!;
}