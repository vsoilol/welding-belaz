using Belaz.WeldingApp.WeldingApi.Contracts.Requests.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IProductManager
{
    Task<List<ProductDto>> GetAllByWeldingTaskStatus(Status status, ProductType productType);

    Task<List<ProductDto>> GetAllByControlSubject(bool isControlSubject, ProductType productType);

    Task<ProductDto?> GetByIdAsync(Guid id);
    
    Task CreateAsync(CreateProductWithoutTypeRequest request, ProductType productType);
    
    Task UpdateAsync(UpdateProductWithoutTypeRequest request);
}