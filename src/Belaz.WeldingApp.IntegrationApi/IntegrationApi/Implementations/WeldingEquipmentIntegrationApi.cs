using AutoMapper;
using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.WeldingEquipment;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Newtonsoft.Json;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Implementations;

public class WeldingEquipmentIntegrationApi : IWeldingEquipmentIntegrationApi
{
    private const string WeldingEquipmentsUrl = "api/weldingEquipment";

    private readonly HttpClient _httpClient;
    private readonly IMapper _mapper;

    public WeldingEquipmentIntegrationApi(HttpClient httpClient, IMapper mapper)
    {
        _httpClient = httpClient;
        _mapper = mapper;
    }

    public async Task<List<WeldingEquipmentDto>> GetAllWeldingEquipmentsAsync()
    {
        var requestUri = WeldingEquipmentsUrl;

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var welders = JsonConvert.DeserializeObject<List<WeldingEquipmentDto>>(responseString);

        return welders ?? new List<WeldingEquipmentDto>();
    }

    public async Task<List<WeldingEquipmentDowntimeDto>> GetAllWeldingEquipmentDowntimesAsync()
    {
        var requestUri = WeldingEquipmentsUrl + "/downtime";

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var welders = JsonConvert.DeserializeObject<List<WeldingEquipmentDowntimeDto>>(responseString);

        return welders ?? new List<WeldingEquipmentDowntimeDto>();
    }
}
