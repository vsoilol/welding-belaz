using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workplace;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IWorkplaceRepository
{
    Task<List<WorkplaceDto>> GetAllAsync();
    
    Task<WorkplaceDto> GetByIdAsync(Guid id);
    
    Task<WorkplaceDto> CreateAsync(Workplace entity);
    
    Task<WorkplaceDto> UpdateAsync(Workplace entity);
}