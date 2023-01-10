using Belaz.WeldingApp.WeldingApi.Contracts.Requests.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface ITechnologicalProcessManager
{
    Task<TechnologicalProcessDto?> GetByIdAsync(Guid id);
    
    Task<List<TechnologicalProcessDto>> GetAllAsync();
    
    Task CreateAsync(CreateTechnologicalProcessRequest request);
    
    Task UpdateAsync(UpdateTechnologicalProcessRequest request);
}