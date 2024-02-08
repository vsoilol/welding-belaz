using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Converters;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;

public class ProductForProductAccountDto : IMapFrom<Belaz.WeldingApp.Common.Entities.ProductInfo.Product>
{
    public Guid Id { get; set; }

    public string? IdFromSystem { get; set; }

    public bool IsControlSubject { get; set; }

    public double ManufacturingTime { get; set; }

    public ProductBriefDto? Product { get; set; }

    public ProductBriefDto? Knot { get; set; }

    public ProductBriefDto? Detail { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<Belaz.WeldingApp.Common.Entities.ProductInfo.Product, ProductForProductAccountDto>()
            .ConvertUsing<ProductForProductAccountDtoConverter>();
    }
}