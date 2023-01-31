using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface ITechnologicalProcessService
{
    Task<Result<TechnologicalProcessDto>> GetByIdAsync(GetTechnologicalProcessByIdRequest request);

    Task<List<TechnologicalProcessDto>> GetAllAsync();

    Task<Result<TechnologicalProcessDto>> CreateAsync(CreateTechnologicalProcessRequest request);

    Task<Result<TechnologicalProcessDto>> UpdateAsync(UpdateTechnologicalProcessRequest request);
}