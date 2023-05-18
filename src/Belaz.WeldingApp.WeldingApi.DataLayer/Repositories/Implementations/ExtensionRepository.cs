using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class ExtensionRepository : IExtensionRepository
{
    public IEnumerable<ProductStructureDto> GetProductStructuresByMainProductIds(
        IReadOnlyCollection<Guid> mainProductIds,
        IReadOnlyCollection<ProductInsideOnlyIdDto> productInsideIds,
        IReadOnlyCollection<ProductBriefDto> products)
    {
        var result = new List<ProductStructureDto>();

        foreach (var mainProductId in mainProductIds)
        {
            var mainProducts = GetMainProducts(mainProductId, productInsideIds, products);

            var productStructure = new ProductStructureDto
            {
                MainProductId = mainProductId,
                Product = mainProducts.Product!,
                Detail = mainProducts.Detail,
                Knot = mainProducts.Knot
            };
            result.Add(productStructure);
        }

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