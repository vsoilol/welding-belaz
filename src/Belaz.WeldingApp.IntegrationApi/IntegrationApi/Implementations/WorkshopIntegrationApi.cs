using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Workshop;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Newtonsoft.Json;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Implementations;

public class WorkshopIntegrationApi : IWorkshopIntegrationApi
{
    private const string WorkshopUrl = "api/workshop";

    private readonly HttpClient _httpClient;

    public WorkshopIntegrationApi(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<List<WorkshopDto>> GetAllAsync()
    {
        var requestUri = WorkshopUrl;

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var workshops = JsonConvert.DeserializeObject<List<WorkshopDto>>(responseString);

        return workshops ?? new List<WorkshopDto>();
    }

    public async Task<WorkshopDto?> GetByIdAsync(Guid id)
    {
        var requestUri = WorkshopUrl + $"/{id}";

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var workshop = JsonConvert.DeserializeObject<WorkshopDto?>(responseString);

        return workshop;
    }
}
