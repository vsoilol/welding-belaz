using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface ITechnologicalInstructionService
{
    Task<List<TechnologicalInstructionDto>> GetAllAsync();

    Task<Result<TechnologicalInstructionDto>> CreateAsync(CreateInstructionRequest request);

    Task<Result<TechnologicalInstructionDto>> UpdateAsync(UpdateInstructionRequest request);

    Task<Result<Unit>> DeleteAsync(DeleteInstructionRequest request);
}
