using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class ProductionAreaProfile : Profile
{
    public ProductionAreaProfile()
    {
        CreateMap<ProductionArea, ProductionAreaDto>();
    }
}