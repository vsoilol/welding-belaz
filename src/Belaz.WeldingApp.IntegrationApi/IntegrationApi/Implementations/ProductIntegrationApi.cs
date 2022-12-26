using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Product;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Newtonsoft.Json;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Implementations;

public class ProductIntegrationApi : IProductIntegrationApi
{
    private const string ProductUrl = "api/product";

    private readonly HttpClient _httpClient;

    public ProductIntegrationApi(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<List<ProductDto>> GetAllByTaskStatusAsync(Status status)
    {
        var requestUri = ProductUrl + $"/byStatus/{status}";

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var products = JsonConvert.DeserializeObject<List<ProductDto>>(responseString);

        return products ?? new List<ProductDto>();
    }

    public async Task<ProductDto?> GetByIdAsync(Guid id)
    {
        var requestUri = ProductUrl + $"/{id}";

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var product = JsonConvert.DeserializeObject<ProductDto?>(responseString);

        return product;
    }
}
