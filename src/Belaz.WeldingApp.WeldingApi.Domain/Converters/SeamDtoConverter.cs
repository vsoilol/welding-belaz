using AutoMapper;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.Domain.Converters;

public class SeamDtoConverter : ITypeConverter<Seam, SeamDto>
{
    private readonly IMapper _mapper;

    public SeamDtoConverter(IMapper mapper)
    {
        _mapper = mapper;
    }

    public SeamDto Convert(Seam source, SeamDto destination, ResolutionContext context)
    {
        destination ??= new SeamDto();

        destination.Id = source.Id;
        destination.IdFromSystem = source.IdFromSystem;
        destination.Number = source.Number;
        destination.Length = source.Length;
        destination.IsPerformed = source.IsPerformed;
        destination.IsControlSubject = source.IsControlSubject;

        MapRelatedEntities(source, destination);

        return destination;
    }

    private void MapRelatedEntities(Seam source, SeamDto destination)
    {
        destination.TechnologicalInstruction = _mapper.Map<TechnologicalInstructionBriefDto>(
            source.TechnologicalInstruction
        );
        destination.TechnologicalProcess = _mapper.Map<TechnologicalProcessBriefDto>(
            source.Product.TechnologicalProcess
        );
        destination.Workshop = _mapper.Map<WorkshopBriefDto>(source.ProductionArea!.Workshop);
        destination.ProductionArea = _mapper.Map<ProductionAreaBriefDto>(source.ProductionArea);

        MapProductsToSeam(source, destination);
    }

    private void MapProductsToSeam(Seam seam, SeamDto seamDto)
    {
        var products = GetSeamProducts(seam);

        if (products.Product != null)
        {
            seamDto.Product = _mapper.Map<ProductOverviewDto>(products.Product);
        }

        if (products.Knot != null)
        {
            seamDto.Knot = _mapper.Map<ProductOverviewDto>(products.Knot);
        }

        if (products.Detail != null)
        {
            seamDto.Detail = _mapper.Map<ProductOverviewDto>(products.Detail);
        }
    }

    private (Product? Product, Product? Knot, Product? Detail) GetSeamProducts(Seam seam)
    {
        var product = GetProductByTypeInHierarchy(seam.Product, ProductType.Product);
        var knot = GetProductByTypeInHierarchy(seam.Product, ProductType.Knot);
        var detail = GetProductByTypeInHierarchy(seam.Product, ProductType.Detail);

        return (product, knot, detail);
    }

    private Product? GetProductByTypeInHierarchy(Product? product, ProductType type)
    {
        while (product?.ProductType != type && product?.ProductMain?.MainProduct != null)
        {
            product = product.ProductMain.MainProduct;
        }

        return product?.ProductType == type ? product : null;
    }
}
