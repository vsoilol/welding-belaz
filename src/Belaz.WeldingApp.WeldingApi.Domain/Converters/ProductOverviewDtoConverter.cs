using AutoMapper;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;

namespace Belaz.WeldingApp.WeldingApi.Domain.Converters;

public class ProductOverviewDtoConverter : ITypeConverter<Product, ProductOverviewDto>
{
    private readonly IMapper _mapper;

    public ProductOverviewDtoConverter(IMapper mapper)
    {
        _mapper = mapper;
    }

    public ProductOverviewDto Convert(
        Product source,
        ProductOverviewDto destination,
        ResolutionContext context
    )
    {
        destination ??= new ProductOverviewDto();

        destination.Id = source.Id;
        destination.IdFromSystem = source.IdFromSystem;
        destination.Number = source.Number;
        destination.Name = source.Name;
        destination.IsControlSubject = source.IsControlSubject;

        MapRelatedEntities(source, destination);

        return destination;
    }

    private void MapRelatedEntities(Product source, ProductOverviewDto destination)
    {
        destination.Workshop = _mapper.Map<WorkshopBriefDto>(source.ProductionArea!.Workshop);
        destination.ProductionArea = _mapper.Map<ProductionAreaBriefDto>(source.ProductionArea);
        destination.TechnologicalProcess = _mapper.Map<TechnologicalProcessBriefDto>(
            source.TechnologicalProcess
        );

        MapMainProductsToProduct(source, destination);
    }

    private void MapMainProductsToProduct(Product source, ProductOverviewDto destination)
    {
        var products = GetMainProducts(source);

        if (products.Product != null)
        {
            destination.Product = _mapper.Map<ProductBriefDto>(products.Product);
        }

        if (products.Knot != null)
        {
            destination.Knot = _mapper.Map<ProductBriefDto>(products.Knot);
        }

        if (products.Detail != null)
        {
            destination.Detail = _mapper.Map<ProductBriefDto>(products.Detail);
        }
    }

    private (Product? Product, Product? Knot, Product? Detail) GetMainProducts(Product product)
    {
        var mainProduct = GetProductByTypeInHierarchy(
            product.ProductMain?.MainProduct,
            ProductType.Product
        );
        var mainKnot = GetProductByTypeInHierarchy(
            product.ProductMain?.MainProduct,
            ProductType.Knot
        );
        var mainDetail = GetProductByTypeInHierarchy(
            product.ProductMain?.MainProduct,
            ProductType.Detail
        );

        return (mainProduct, mainKnot, mainDetail);
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
