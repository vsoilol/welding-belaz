using Belaz.WeldingApp.RegistarApi.Domain.Entities.Production;
using Belaz.WeldingApp.RegistarApi.Domain.Mappings;

namespace Belaz.WeldingApp.RegistarApi.Domain.Dtos;

public class PostDto : IMapFrom<Post>
{
    public Guid Id { get; set; }
    
    public int Number { get; set; }
}