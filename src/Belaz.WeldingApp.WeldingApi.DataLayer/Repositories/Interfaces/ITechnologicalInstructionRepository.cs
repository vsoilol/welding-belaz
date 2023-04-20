using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface ITechnologicalInstructionRepository
{
    Task<List<TechnologicalInstructionDto>> GetAllAsync();

    Task<TechnologicalInstructionDto> GetByIdAsync(Guid id);

    Task<TechnologicalInstructionDto> CreateAsync(
        TechnologicalInstruction entity,
        List<WeldPassageInstruction> weldPassages
    );

    Task<TechnologicalInstructionDto> UpdateAsync(
        TechnologicalInstruction entity,
        List<WeldPassageInstruction> weldPassages
    );

    Task DeleteAsync(Guid id);
}
