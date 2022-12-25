using Belaz.WeldingApp.IntegrationApi.Contracts.Requests.Identity;
using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Identity;
using Belaz.WeldingApp.IntegrationApi.Extensions;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Newtonsoft.Json;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Implementations;

public class AuthIntegrationApi : IAuthIntegrationApi
{
    private const string AuthUrl = "api/auth";

    private readonly HttpClient _httpClient;

    public AuthIntegrationApi(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<AuthSuccessResponse> Register(RegisterModelContract registerContract)
    {
        var requestUri = AuthUrl + "/register";

        var content = JsonContent.Create(registerContract);

        var response = await _httpClient.PostAsync(requestUri, content);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var authResult = JsonConvert.DeserializeObject<AuthSuccessResponse>(responseString);

        if (authResult is null)
        {
            throw new HttpRequestException("Cannot convert model from request");
        }

        return authResult;
    }

    public async Task<AuthSuccessResponse> Login(LoginModelContract loginContract)
    {
        var requestUri = AuthUrl + "/login";

        var content = JsonContent.Create(loginContract);

        var response = await _httpClient.PostAsync(requestUri, content);

        await response.EnsureSuccessStatusCodeAsync();

        var responseString = await response.Content.ReadAsStringAsync();

        var authResult = JsonConvert.DeserializeObject<AuthSuccessResponse>(responseString);

        if (authResult is null)
        {
            throw new HttpRequestException("Cannot convert model from request");
        }

        return authResult;
    }

    public async Task<bool> Logout()
    {
        var requestUri = AuthUrl + "/logout";

        var response = await _httpClient.PostAsync(requestUri, null);

        response.EnsureSuccessStatusCode();

        var responseString = await response.Content.ReadAsStringAsync();

        var result = JsonConvert.DeserializeObject<bool>(responseString);

        return result;
    }
}
