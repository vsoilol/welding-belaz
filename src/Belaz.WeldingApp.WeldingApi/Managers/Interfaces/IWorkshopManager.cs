using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Workshop;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Workshop;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IWorkshopManager
{
    Task<List<WorkshopDto>> GetAllAsync();
    
    Task<WorkshopDto?> GetByIdAsync(Guid id);

    Task<WorkshopDto?> CreateAsync(CreateWorkshopRequest request);
    
    Task UpdateAsync(CreateWorkshopRequest request);
}