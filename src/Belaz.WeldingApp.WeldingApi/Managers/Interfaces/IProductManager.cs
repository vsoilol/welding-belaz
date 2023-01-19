using Belaz.WeldingApp.WeldingApi.Contracts.Requests.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IProductManager
{
    Task<List<ProductDto>> GetAllByWeldingTaskStatus(Status status, ProductType productType);

    Task<List<ProductDto>> GetAllByControlSubject(bool isControlSubject, ProductType productType);

    Task<ProductDto?> GetByIdAsync(Guid id);
    
    Task<List<ProductDto>> GetAllByMasterIdAsync(Guid masterId, ProductType productType);
    
    Task<List<ProductDto>> GetAllByInspectorIdAsync(Guid inspectorId, ProductType productType);
    
    Task<ProductDto?> CreateAsync(CreateProductWithoutTypeRequest request, ProductType productType);
    
    Task<ProductDto?> UpdateAsync(UpdateProductWithoutTypeRequest request, ProductType productType);
    
    Task AssignProductToMasterAsync(AssignProductToMasterRequest request);
    
    Task AssignProductToInspectorAsync(AssignProductToInspectorRequest request);
}