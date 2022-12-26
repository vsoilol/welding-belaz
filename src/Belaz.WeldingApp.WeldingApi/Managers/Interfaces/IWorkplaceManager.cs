using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Workplace;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IWorkplaceManager
{
    Task<List<WorkplaceDto>> GetAllAsync();
    
    Task<WorkplaceDto?> GetByIdAsync(Guid id);
}