using Belaz.WeldingApp.WeldingApi.Contracts.Requests.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IProductionAreaManager
{
    Task<List<ProductionAreaDto>> GetAllAsync();
    
    Task<ProductionAreaDto?> GetByIdAsync(Guid id);
    
    Task<ProductionAreaDto?> CreateAsync(CreateProductionAreaRequest request);
    
    Task<bool> UpdateAsync(UpdateProductionAreaRequest request);
}