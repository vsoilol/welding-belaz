using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class ProductProfile : Profile
{
    public ProductProfile()
    {
        CreateMap<Product, ProductBriefDto>();

        CreateMap<Product, ProductDto>()
            .ForMember(dto => dto.InsideProducts,
                opt => opt
                    .MapFrom(
                        x => x.ProductInsides.Select(_ => _.InsideProduct)))
            .ForMember(dto => dto.Seams,
                opt => opt
                    .MapFrom(x => x.Seams))
            .ForMember(dto => dto.TechnologicalProcessName,
                opt => opt
                    .MapFrom(x => x.TechnologicalProcess.Name))
            .ForMember(dto => dto.TechnologicalProcessId,
                opt => opt
                    .MapFrom(x => x.TechnologicalProcess.Id))
            .ForMember(dto => dto.TechnologicalProcessNumber,
                opt => opt
                    .MapFrom(x => x.TechnologicalProcess.Number))
            .ForMember(dto => dto.WorkplaceNumber,
                opt => opt
                    .MapFrom(x => x.WeldingTask.Welder.Workplace.Number))
            .ForMember(dto => dto.WorkshopNumber,
                opt => opt
                    .MapFrom(x => x.WeldingTask.Welder.Workplace.ProductionArea.Workshop.Number))
            .ForMember(dto => dto.ProductionAreaNumber,
                opt => opt
                    .MapFrom(x => x.WeldingTask.Welder.Workplace.ProductionArea.Number));
    }
}