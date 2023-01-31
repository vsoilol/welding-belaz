using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Post;

public class UpdatePostRequest : IMapTo<Domain.Entities.Production.Post>
{
    public Guid Id { get; set; }
    
    public int Number { get; set; }
    
    public string Name { get; set; } = null!;

    public Guid ProductionAreaId { get; set; }
}