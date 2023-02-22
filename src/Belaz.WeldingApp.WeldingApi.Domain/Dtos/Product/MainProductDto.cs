using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;

public class MainProductDto : IMapFrom<Entities.ProductInfo.Product>
{
    public Guid Id { get; set; }

    public string? IdFromSystem { get; set; }

    public string? Name { get; set; }

    public string Number { get; set; } = null!;

    public ProductType ProductType { get; set; }

    public MainProductDto? MainProduct { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<Entities.ProductInfo.Product, MainProductDto>()
            .ForMember(dto => dto.MainProduct, opt => opt.MapFrom(x => x.ProductMain!.MainProduct));
    }
}
