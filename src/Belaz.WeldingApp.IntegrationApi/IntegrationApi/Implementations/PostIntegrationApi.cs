using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Post;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Newtonsoft.Json;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Implementations;

public class PostIntegrationApi : IPostIntegrationApi
{
    private const string PostUrl = "api/post";

    private readonly HttpClient _httpClient;

    public PostIntegrationApi(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<List<PostDto>> GetAllAsync()
    {
        var requestUri = PostUrl;

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var posts = JsonConvert.DeserializeObject<List<PostDto>>(responseString);

        return posts ?? new List<PostDto>();
    }

    public async Task<PostDto?> GetByIdAsync(Guid id)
    {
        var requestUri = PostUrl + $"/{id}";

        var response = await _httpClient.GetAsync(requestUri);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var post = JsonConvert.DeserializeObject<PostDto?>(responseString);

        return post;
    }
}
