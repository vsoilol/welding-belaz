using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Post;

public class PostDto : IMapFrom<Belaz.WeldingApp.Common.Entities.Production.Post>
{
    public Guid Id { get; set; }

    public string? IdFromSystem { get; set; }

    public int Number { get; set; }

    public string Name { get; set; } = null!;

    public ProductionAreaBriefDto ProductionArea { get; set; } = null!;

    public WorkshopBriefDto Workshop { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<Belaz.WeldingApp.Common.Entities.Production.Post, PostDto>()
            .ForMember(dto => dto.Workshop, opt => opt.MapFrom(x => x.ProductionArea.Workshop));
    }
}
