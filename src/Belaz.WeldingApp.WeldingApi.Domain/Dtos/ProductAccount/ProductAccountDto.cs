using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;

public class ProductAccountDto : IMapFrom<Domain.Entities.ProductInfo.ProductAccount>
{
    public int Number { get; set; }

    public int AmountFromPlan { get; set; }

    public ProductBriefDto Product { get; set; } = null!;

    public int AmountManufactured { get; set; }

    public int AmountAccept { get; set; }

    public int AmountDefective { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<Domain.Entities.ProductInfo.ProductAccount, ProductAccountDto>()
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
            );
    }
}
