using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IProductManager
{
    Task<List<ProductDto>> GetAllProductsByWeldingTaskStatus(Status status);
    
    Task<List<ProductDto>> GetAllDetailsByWeldingTaskStatus(Status status);
    
    Task<List<ProductDto>> GetAllKnotsByWeldingTaskStatus(Status status);
    
    Task<ProductDto?> GetProductByIdAsync(Guid id);
    
    Task<ProductDto?> GetDetailByIdAsync(Guid id);
    
    Task<ProductDto?> GetKnotByIdAsync(Guid id);
}