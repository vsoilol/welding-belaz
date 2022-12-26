using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.WeldingTask;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Newtonsoft.Json;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Implementations;

public class WeldingTaskIntegrationApi : IWeldingTaskIntegrationApi
{
    private const string WeldingTaskUrl = "api/weldingTask";

    private readonly HttpClient _httpClient;

    public WeldingTaskIntegrationApi(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<List<WeldingTaskFullNamesDto>> GetAllWithFullNamesAsync()
    {
        var requestUri = WeldingTaskUrl + "/fullNames";

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var weldingTaskFullNames = JsonConvert.DeserializeObject<List<WeldingTaskFullNamesDto>>(responseString);

        return weldingTaskFullNames ?? new List<WeldingTaskFullNamesDto>();
    }

    public async Task<List<WeldingTaskRegistrarInfoDto>> GetAllRegistrarInfoAsync()
    {
        var requestUri = WeldingTaskUrl + "/registrarInfo";

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var registrarInfo = JsonConvert.DeserializeObject<List<WeldingTaskRegistrarInfoDto>>(responseString);

        return registrarInfo ?? new List<WeldingTaskRegistrarInfoDto>();
    }
}
