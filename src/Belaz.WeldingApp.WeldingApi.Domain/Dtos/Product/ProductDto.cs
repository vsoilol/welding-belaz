using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workplace;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;

public class ProductDto : IMapFrom<Entities.ProductInfo.Product>
{
    public Guid Id { get; set; }

    public string? Name { get; set; }

    public int Number { get; set; }

    public WorkplaceBriefDto? Workplace { get; set; }

    public ProductionAreaBriefDto ProductionArea { get; set; } = null!;

    public WorkshopBriefDto Workshop { get; set; } = null!;

    public TechnologicalProcessBriefDto TechnologicalProcess { get; set; } = null!;

    public List<ProductBriefDto> InsideProducts { get; set; } = null!;

    public List<SeamBriefDto> Seams { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile.CreateMap<Entities.ProductInfo.Product, ProductDto>()
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
                    .MapFrom(x => x.ProductionArea!.Workshop))
            .ForMember(dto => dto.Workplace,
                opt => opt
                    .MapFrom(x => x.Workplace))
            .ForMember(dto => dto.TechnologicalProcess,
                opt => opt
                    .MapFrom(x =>
                        x.TechnologicalProcess ?? x.ProductMains
                            .FirstOrDefault(_ => _.MainProduct.ProductType == ProductType.Product)!
                            .MainProduct.TechnologicalProcess));
    }
}