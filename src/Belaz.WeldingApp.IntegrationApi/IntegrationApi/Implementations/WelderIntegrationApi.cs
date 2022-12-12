using AutoMapper;
using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Identity;
using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Welder;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Newtonsoft.Json;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Implementations;

public class WelderIntegrationApi : IWelderIntegrationApi
{
    private const string WeldersUrl = "api/welders";

    private readonly HttpClient _httpClient;
    private readonly IMapper _mapper;

    public WelderIntegrationApi(HttpClient httpClient, IMapper mapper)
    {
        _httpClient = httpClient;
        _mapper = mapper;
    }

    public async Task<List<WelderDto>> GetAllWeldersAsync()
    {
        var requestUri = WeldersUrl;

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var welders = JsonConvert.DeserializeObject<List<WelderDto>>(responseString);

        return welders ?? new List<WelderDto>();
    }
}
