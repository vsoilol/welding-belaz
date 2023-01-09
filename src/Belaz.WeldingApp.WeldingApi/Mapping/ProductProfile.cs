using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;
using WeldingApp.Common.Enums;

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
            .ForMember(dto => dto.ProductionArea,
                opt => opt
                    .MapFrom(x => x.ProductionArea))
            .ForMember(dto => dto.Workshop,
                opt => opt
                    .MapFrom(x => x.ProductionArea.Workshop))
            .ForMember(dto => dto.Workplace,
                opt => opt
                    .MapFrom(x => x.Workplace))
            .ForMember(dto => dto.TechnologicalProcess,
                opt => opt
                    .MapFrom(x =>
                        x.TechnologicalProcess == null
                            ? x.ProductMains
                                .FirstOrDefault(_ => _.MainProduct.ProductType == ProductType.Product)
                                .MainProduct.TechnologicalProcess
                            : x.TechnologicalProcess));

        CreateMap<CreateProductWithoutTypeRequest, Product>()
            .ForMember(dto => dto.Seams,
                opt => opt.Ignore())
            .ForMember(dto => dto.ProductInsides,
                opt => opt
                    .MapFrom(x => x.InsideProducts.Select(_ => new ProductInside
                    {
                        InsideProductId = _
                    })));
    }
}