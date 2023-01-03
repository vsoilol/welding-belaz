using Belaz.WeldingApp.WeldingApi.Contracts.Requests.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface ITechnologicalInstructionManager
{
    Task<List<TechnologicalInstructionDto>> GetAllAsync();
    
    Task CreateAsync(CreateInstructionRequest request);
    
    Task UpdateAsync(UpdateInstructionRequest request);
}