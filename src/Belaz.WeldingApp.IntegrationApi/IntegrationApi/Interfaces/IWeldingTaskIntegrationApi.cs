using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.WeldingTask;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;

public interface IWeldingTaskIntegrationApi
{
    Task<List<WeldingTaskFullNamesDto>> GetAllWithFullNamesAsync();

    Task<List<WeldingTaskRegistrarInfoDto>> GetAllRegistrarInfoAsync();
}
