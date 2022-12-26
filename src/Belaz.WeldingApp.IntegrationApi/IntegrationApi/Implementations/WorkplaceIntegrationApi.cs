using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Workplace;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Newtonsoft.Json;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Implementations;

public class WorkplaceIntegrationApi : IWorkplaceIntegrationApi
{
    private const string WorkplaceUrl = "api/workplace";

    private readonly HttpClient _httpClient;

    public WorkplaceIntegrationApi(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<List<WorkplaceDto>> GetAllAsync()
    {
        var requestUri = WorkplaceUrl;

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var workplaces = JsonConvert.DeserializeObject<List<WorkplaceDto>>(responseString);

        return workplaces ?? new List<WorkplaceDto>();
    }

    public async Task<WorkplaceDto?> GetByIdAsync(Guid id)
    {
        var requestUri = WorkplaceUrl + $"/{id}";

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var workplace = JsonConvert.DeserializeObject<WorkplaceDto?>(responseString);

        return workplace;
    }
}
