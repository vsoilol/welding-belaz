using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Converters;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;

public class ProductDto : IMapFrom<Belaz.WeldingApp.Common.Entities.ProductInfo.Product>
{
    public Guid Id { get; set; }

    public string? IdFromSystem { get; set; }

    public string? Name { get; set; }

    public string Number { get; set; } = null!;

    public bool IsControlSubject { get; set; }

    public double ManufacturingTime { get; set; }

    public ProductionAreaBriefDto ProductionArea { get; set; } = null!;

    public WorkshopBriefDto Workshop { get; set; } = null!;

    public TechnologicalProcessBriefDto TechnologicalProcess { get; set; } = null!;

    public List<ProductInsideDto> InsideProducts { get; set; } = null!;

    public List<SeamDto> Seams { get; set; } = null!;

    public ProductBriefDto? Product { get; set; }

    public ProductBriefDto? Knot { get; set; }

    public ProductBriefDto? Detail { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<Belaz.WeldingApp.Common.Entities.ProductInfo.Product, ProductDto>()
            .ConvertUsing<ProductDtoConverter>();
        ;
    }
}
