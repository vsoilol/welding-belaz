using Belaz.WeldingApp.WeldingApi.Contracts.Responses.TechnologicalProcess;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface ITechnologicalProcessManager
{
    Task<TechnologicalProcessDto?> GetByIdAsync(Guid id);
}