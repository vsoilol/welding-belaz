using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IWorkshopRepository
{
    Task<List<WorkshopDto>> GetAllAsync();

    Task<WorkshopDto> GetByIdAsync(Guid id);

    Task<WorkshopDto> CreateAsync(Workshop entity);

    Task<WorkshopDto> UpdateAsync(Workshop entity);

    Task DeleteAsync(Guid id);
}
