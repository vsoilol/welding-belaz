using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Welder;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;

public interface IWelderIntegrationApi
{
    Task<List<WelderDto>> GetAllWeldersAsync();
}
