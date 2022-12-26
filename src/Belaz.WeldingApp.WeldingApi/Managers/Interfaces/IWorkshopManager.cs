using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Workshop;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IWorkshopManager
{
    Task<List<WorkshopDto>> GetAllAsync();
    
    Task<WorkshopDto?> GetByIdAsync(Guid id);
}