using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.TechnologicalProcess;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;

public interface ITechnologicalProcessIntegrationApi
{
    Task<TechnologicalProcessDto?> GetByIdAsync(Guid id);
}
