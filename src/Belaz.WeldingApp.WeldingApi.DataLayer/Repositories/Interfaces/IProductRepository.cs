using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IProductRepository
{
    Task<List<ProductDto>> GetAllAsync(ProductType productType);

    Task<List<ProductDto>> GetAllByControlSubjectAsync(
        bool isControlSubject,
        ProductType productType
    );

    Task<ProductDto> GetByIdAsync(Guid id);

    Task<List<ProductDto>> GetAllByMasterIdAsync(Guid masterId, ProductType productType);

    Task<List<ProductDto>> GetAllByInspectorIdAsync(Guid inspectorId, ProductType productType);

    Task<ProductDto> CreateAsync(Product entity, Guid mainProductId);

    Task<ProductDto> UpdateAsync(Product entity, Guid mainProductId);

    Task AssignProductToMasterAsync(Guid productId, Guid masterId);

    Task AssignProductsToMasterAsync(List<Guid> productIds, Guid masterId);

    Task AssignProductToInspectorAsync(Guid productId, Guid inspectorId);

    Task AssignProductsToInspectorAsync(List<Guid> productIds, Guid inspectorId);

    Task AssignProductToWeldersAsync(Guid productId, List<Guid> welderIds);

    Task<List<ProductDto>> GetAllByWelderId(Guid welderId, ProductType productType);
}
