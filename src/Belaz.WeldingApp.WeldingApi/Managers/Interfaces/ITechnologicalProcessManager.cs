using Belaz.WeldingApp.WeldingApi.Contracts.Responses;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface ITechnologicalProcessManager
{
    Task<TechnologicalProcessDto?> GetByIdAsync(Guid id);
    
    Task<List<TechnologicalProcessDto>> GetAllAsync();
}