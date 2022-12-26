using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.TechnologicalProcess;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Newtonsoft.Json;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Implementations;

public class TechnologicalProcessIntegrationApi : ITechnologicalProcessIntegrationApi
{
    private const string TechnologicalProcessUrl = "api/technologicalProcess";

    private readonly HttpClient _httpClient;

    public TechnologicalProcessIntegrationApi(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<TechnologicalProcessDto?> GetByIdAsync(Guid id)
    {
        var requestUri = TechnologicalProcessUrl + $"/{id}";

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var technologicalProcess = JsonConvert.DeserializeObject<TechnologicalProcessDto?>(responseString);

        return technologicalProcess;
    }
}
