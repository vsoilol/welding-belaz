using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Post;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workplace;

public class WorkplaceDto : IMapFrom<Entities.Production.Workplace>
{
    public Guid Id { get; set; }

    public string? IdFromSystem { get; set; }

    public int Number { get; set; }

    public PostBriefDto? Post { get; set; }

    public ProductionAreaBriefDto ProductionArea { get; set; } = null!;

    public WorkshopBriefDto Workshop { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<Entities.Production.Workplace, WorkplaceDto>()
            .ForMember(
                dto => dto.ProductionArea,
                opt => opt.MapFrom(x => x.Post == null ? x.ProductionArea : x.Post.ProductionArea)
            )
            .ForMember(
                dto => dto.Workshop,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.Post == null
                                ? x.ProductionArea!.Workshop
                                : x.Post.ProductionArea.Workshop
                    )
            );
    }
}
