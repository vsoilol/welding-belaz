using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Production;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class ProductionProfile : Profile
{
    public ProductionProfile()
    {
        CreateMap<Workplace, ProductionBriefDto>();
        CreateMap<Workshop, ProductionBriefDto>();
        CreateMap<Post, ProductionBriefDto>();
        CreateMap<ProductionArea, ProductionBriefDto>();
        CreateMap<ProductionArea, ProductionWithNameDto>();
        CreateMap<Workshop, ProductionWithNameDto>();
    }
}