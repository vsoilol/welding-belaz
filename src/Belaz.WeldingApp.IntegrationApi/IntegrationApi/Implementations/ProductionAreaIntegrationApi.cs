using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.ProductionArea;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Newtonsoft.Json;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Implementations;

public class ProductionAreaIntegrationApi : IProductionAreaIntegrationApi
{
    private const string ProductionAreaUrl = "api/productionArea";

    private readonly HttpClient _httpClient;

    public ProductionAreaIntegrationApi(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<List<ProductionAreaDto>> GetAllAsync()
    {
        var requestUri = ProductionAreaUrl;

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var productionAreas = JsonConvert.DeserializeObject<List<ProductionAreaDto>>(responseString);

        return productionAreas ?? new List<ProductionAreaDto>();
    }

    public async Task<ProductionAreaDto?> GetByIdAsync(Guid id)
    {
        var requestUri = ProductionAreaUrl + $"/{id}";

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var productionArea = JsonConvert.DeserializeObject<ProductionAreaDto?>(responseString);

        return productionArea;
    }
}
