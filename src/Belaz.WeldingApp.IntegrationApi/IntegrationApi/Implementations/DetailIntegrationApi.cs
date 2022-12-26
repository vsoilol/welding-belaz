using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Detail;
using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.WeldingEquipment;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Newtonsoft.Json;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Implementations;

public class DetailIntegrationApi : IDetailIntegrationApi
{
    private const string DetailUrl = "api/detail";

    private readonly HttpClient _httpClient;

    public DetailIntegrationApi(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<List<DetailDto>> GetAllByTaskStatusAsync(Status status)
    {
        var requestUri = DetailUrl + $"/byStatus/{status}";

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var details = JsonConvert.DeserializeObject<List<DetailDto>>(responseString);

        return details ?? new List<DetailDto>();
    }

    public async Task<DetailDto?> GetByIdAsync(Guid id)
    {
        var requestUri = DetailUrl + $"/{id}";

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var detail = JsonConvert.DeserializeObject<DetailDto?>(responseString);

        return detail;
    }
}
