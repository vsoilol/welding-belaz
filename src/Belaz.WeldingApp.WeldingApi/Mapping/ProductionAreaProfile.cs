using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class ProductionAreaProfile : Profile
{
    public ProductionAreaProfile()
    {
        CreateMap<ProductionArea, ProductionAreaDto>()
            .ForMember(dto => dto.Workshop,
                opt => opt
                    .MapFrom(x => x.Workshop));
        CreateMap<CreateProductionAreaRequest, ProductionArea>();
        CreateMap<UpdateProductionAreaRequest, ProductionArea>();
    }
}