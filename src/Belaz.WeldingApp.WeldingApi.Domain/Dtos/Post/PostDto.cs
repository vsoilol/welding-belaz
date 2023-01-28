using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Post;

public class PostDto : IMapFrom<Entities.Production.Post>
{
    public Guid Id { get; set; }
    
    public int Number { get; set; }

    public string Name { get; set; } = null!;

    public ProductionAreaBriefDto ProductionArea { get; set; } = null!;
}