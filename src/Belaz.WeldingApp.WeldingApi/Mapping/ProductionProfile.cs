using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class ProductionProfile : Profile
{
    public ProductionProfile()
    {
        CreateMap<Workplace, ProductionBriefDto>()
            .ForMember(dto => dto.WorkplaceNumber,
                opt => opt
                    .MapFrom(x => x.Number))
            .ForMember(dto => dto.WorkshopNumber,
                opt => opt
                    .MapFrom(x => x.ProductionArea.Workshop.Number))
            .ForMember(dto => dto.ProductionAreaNumber,
                opt => opt
                    .MapFrom(x => x.ProductionArea.Number));
    }
}