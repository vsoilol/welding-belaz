using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Seam;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Newtonsoft.Json;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Implementations;

public class SeamIntegrationApi : ISeamIntegrationApi
{
    private const string SeamUrl = "api/seam";

    private readonly HttpClient _httpClient;

    public SeamIntegrationApi(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<List<SeamDto>> GetAllByTaskStatusAsync(Status status)
    {
        var requestUri = SeamUrl + $"/byStatus/{status}";

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var seams = JsonConvert.DeserializeObject<List<SeamDto>>(responseString);

        return seams ?? new List<SeamDto>();
    }

    public async Task<SeamDto?> GetByIdAsync(Guid id)
    {
        var requestUri = SeamUrl + $"/{id}";

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var seam = JsonConvert.DeserializeObject<SeamDto?>(responseString);

        return seam;
    }
}
