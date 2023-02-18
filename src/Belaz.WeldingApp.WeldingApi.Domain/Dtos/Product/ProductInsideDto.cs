using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workplace;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;

public class ProductInsideDto: IMapFrom<Entities.ProductInfo.Product>
{
    public Guid Id { get; set; }
    
    public string? IdFromSystem { get; set; }

    public string? Name { get; set; }

    public string Number { get; set; } = null!;
    
    public bool IsControlSubject { get; set; }

    public ProductionAreaBriefDto ProductionArea { get; set; } = null!;

    public WorkshopBriefDto Workshop { get; set; } = null!;

    public TechnologicalProcessBriefDto TechnologicalProcess { get; set; } = null!;
    
    public ProductType ProductType { get; set; }

    public void Mapping(Profile profile)
    {
        profile.CreateMap<Entities.ProductInfo.Product, ProductInsideDto>()
            .ForMember(dto => dto.ProductionArea,
                opt => opt
                    .MapFrom(x => x.ProductionArea))
            .ForMember(dto => dto.Workshop,
                opt => opt
                    .MapFrom(x => x.ProductionArea!.Workshop))
            .ForMember(dto => dto.TechnologicalProcess,
                opt => opt
                    .MapFrom(x =>
                        x.TechnologicalProcess ?? x.ProductMain!.MainProduct.TechnologicalProcess));
    }
}