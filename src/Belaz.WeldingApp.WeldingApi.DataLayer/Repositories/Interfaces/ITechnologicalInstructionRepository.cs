using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface ITechnologicalInstructionRepository
{
    Task<List<TechnologicalInstructionDto>> GetAllAsync();

    Task<TechnologicalInstructionDto> GetByIdAsync(Guid id);

    Task<TechnologicalInstructionDto> CreateAsync(TechnologicalInstruction entity, List<WeldPassage> weldPassages);

    Task<TechnologicalInstructionDto> UpdateAsync(TechnologicalInstruction entity, List<WeldPassage> weldPassages);
}