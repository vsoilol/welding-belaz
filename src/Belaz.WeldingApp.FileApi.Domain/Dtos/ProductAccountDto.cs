using AutoMapper;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class ProductAccountDto : IMapFrom<ProductAccount>
{
    public int AmountFromPlan { get; set; }
    
    public DateTime DateFromPlan { get; set; }
    
    public int AmountManufactured { get; set; }

    public int AmountAccept { get; set; }
    
    public int AmountDefective { get; set; }
    
    public ProductBriefDto Product { get; set; } = null!;

    public ProductionAreaBriefDto ProductionArea { get; set; } = null!;
    
    public WorkshopBriefDto Workshop { get; set; } = null!;
    
    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<ProductAccount, ProductAccountDto>()
            .ForMember(
                dto => dto.AmountManufactured,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.ProductResults
                                .Where(_ => _.Status == ResultProductStatus.Manufactured)
                                .Sum(_ => _.Amount)
                    )
            )
            .ForMember(
                dto => dto.AmountAccept,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.ProductResults
                                .Where(_ => _.Status == ResultProductStatus.Accept)
                                .Sum(_ => _.Amount)
                    )
            )
            .ForMember(
                dto => dto.AmountDefective,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.ProductResults
                                .Where(_ => _.Status == ResultProductStatus.Defective)
                                .Sum(_ => _.Amount)
                    )
            )
            .ForMember(
                dto => dto.ProductionArea,
                opt =>
                    opt.MapFrom(x => x.Product.ProductionArea)
            )
            .ForMember(
                dto => dto.Workshop,
                opt =>
                    opt.MapFrom(x => x.Product.ProductionArea.Workshop)
            );
    }
}