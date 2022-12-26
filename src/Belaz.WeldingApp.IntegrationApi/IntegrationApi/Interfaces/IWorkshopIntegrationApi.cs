using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Workshop;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;

public interface IWorkshopIntegrationApi
{
    Task<List<WorkshopDto>> GetAllAsync();

    Task<WorkshopDto?> GetByIdAsync(Guid id);
}
