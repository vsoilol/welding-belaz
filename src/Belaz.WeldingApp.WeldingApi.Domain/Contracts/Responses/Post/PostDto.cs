using Belaz.WeldingApp.WeldingApi.Domain.Contracts.Responses.Production;

namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Responses.Post;

public class PostDto
{
    public Guid Id { get; set; }
    
    public int Number { get; set; }

    public string Name { get; set; } = null!;

    public ProductionWithNameDto ProductionArea { get; set; } = null!;
}