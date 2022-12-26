using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Knot;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Newtonsoft.Json;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Implementations;

public class KnotIntegrationApi : IKnotIntegrationApi
{
    private const string KnotUrl = "api/knot";

    private readonly HttpClient _httpClient;

    public KnotIntegrationApi(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<List<KnotDto>> GetAllByTaskStatusAsync(Status status)
    {
        var requestUri = KnotUrl + $"/byStatus/{status}";

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var knots = JsonConvert.DeserializeObject<List<KnotDto>>(responseString);

        return knots ?? new List<KnotDto>();
    }

    public async Task<KnotDto?> GetByIdAsync(Guid id)
    {
        var requestUri = KnotUrl + $"/{id}";

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var knot = JsonConvert.DeserializeObject<KnotDto?>(responseString);

        return knot;
    }
}
