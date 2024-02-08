using AutoMapper;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

public class ExtensionRepository : IExtensionRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public ExtensionRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public ProductStructureDto GetProductStructureByMainProductId(Guid mainProductId, IReadOnlyCollection<ProductInsideOnlyIdDto> productInsideIds,
        IReadOnlyCollection<ProductBriefDto> products)
    {
        var mainProducts = GetMainProducts(mainProductId, productInsideIds, products);

        var result = new ProductStructureDto
        {
            Product = mainProducts.Product!,
            Detail = mainProducts.Detail,
            Knot = mainProducts.Knot,
        };

        return result;
    }

    private (ProductBriefDto? Product, ProductBriefDto? Knot, ProductBriefDto? Detail)
        GetMainProducts(
            Guid productChildId,
            IReadOnlyCollection<ProductInsideOnlyIdDto> productInsideIds,
            IReadOnlyCollection<ProductBriefDto> products
        )
    {
        var productChild = products.FirstOrDefault(_ => _.Id == productChildId)!;

        var mainProduct = GetProductByTypeInHierarchy(
            productChild,
            productInsideIds,
            products,
            ProductType.Product
        );
        var mainKnot = GetProductByTypeInHierarchy(
            productChild,
            productInsideIds,
            products,
            ProductType.Knot
        );
        var mainDetail = GetProductByTypeInHierarchy(
            productChild,
            productInsideIds,
            products,
            ProductType.Detail
        );

        return (mainProduct, mainKnot, mainDetail);
    }

    private ProductBriefDto? GetProductByTypeInHierarchy(ProductBriefDto? productChild,
        IReadOnlyCollection<ProductInsideOnlyIdDto> productInsideIds,
        IReadOnlyCollection<ProductBriefDto> products,
        ProductType type)
    {
        while (productChild?.ProductType != type && productInsideIds.Any(_ => _.InsideProductId == productChild?.Id))
        {
            var insideProduct = productInsideIds.FirstOrDefault(_ => _.InsideProductId == productChild?.Id);

            if (insideProduct is null)
            {
                return null;
            }

            productChild = products.FirstOrDefault(_ => _.Id == insideProduct.MainProductId)!;
        }

        return productChild?.ProductType == type ? productChild : null;
    }
}