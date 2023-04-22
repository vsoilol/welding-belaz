using AutoMapper;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;

public class ProductAccountBriefDto : IMapFrom<ProductAccount>
{
    public DateTime DateFromPlan { get; set; }

    /// <summary>
    /// Норма времени на изготовление
    /// </summary>
    public double ManufacturingTime { get; set; }

    public int AmountFromPlan { get; set; }

    public int AmountManufactured { get; set; }

    public int AmountAccept { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<ProductAccount, ProductAccountBriefDto>()
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
                dto => dto.ManufacturingTime,
                opt => opt.MapFrom(x => x.Product.ManufacturingTime)
            );
    }
}
