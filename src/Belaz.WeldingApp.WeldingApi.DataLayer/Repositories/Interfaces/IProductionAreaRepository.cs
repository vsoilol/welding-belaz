using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.Common.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IProductionAreaRepository
{
    Task<List<ProductionAreaDto>> GetAllAsync();

    Task<ProductionAreaDto> GetByIdAsync(Guid id);

    Task<ProductionAreaDto> CreateAsync(ProductionArea entity);

    Task<ProductionAreaDto> UpdateAsync(ProductionArea entity);

    Task<ProductionAreaDto> DeleteAsync(Guid id);
}
