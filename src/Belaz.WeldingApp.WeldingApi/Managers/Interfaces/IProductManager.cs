using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IProductManager
{
    Task<List<ProductDto>> GetAllProductsByWeldingTaskStatus(Status status);
    
    Task<List<ProductDto>> GetAllDetailsByWeldingTaskStatus(Status status);
    
    Task<List<ProductDto>> GetAllKnotsByWeldingTaskStatus(Status status);
    
    Task<List<ProductDto>> GetAllProductsByControlSubject(bool isControlSubject);
    
    Task<List<ProductDto>> GetAllDetailsByControlSubject(bool isControlSubject);
    
    Task<List<ProductDto>> GetAllKnotsByControlSubject(bool isControlSubject);
    
    Task<ProductDto?> GetProductByIdAsync(Guid id);
    
    Task<ProductDto?> GetDetailByIdAsync(Guid id);
    
    Task<ProductDto?> GetKnotByIdAsync(Guid id);
}