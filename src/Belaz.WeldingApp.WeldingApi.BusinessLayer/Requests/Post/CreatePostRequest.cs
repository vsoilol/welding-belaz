using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Post;

public class CreatePostRequest : IMapTo<Belaz.WeldingApp.Common.Entities.Production.Post>
{
    public int Number { get; set; }

    public string Name { get; set; } = null!;

    public Guid ProductionAreaId { get; set; }
}
