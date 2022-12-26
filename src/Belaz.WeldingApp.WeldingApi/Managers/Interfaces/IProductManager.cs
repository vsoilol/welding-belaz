using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Product;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IProductManager
{
    Task<List<ProductDto>> GetAllByWeldingTaskStatus(Status status);
    
    Task<ProductDto?> GetByIdAsync(Guid id);
}