using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Workplace;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;

public interface IWorkplaceIntegrationApi
{
    Task<List<WorkplaceDto>> GetAllAsync();

    Task<WorkplaceDto?> GetByIdAsync(Guid id);
}
