using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Identity;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Newtonsoft.Json;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Implementations
{
    public class UserIntegrationApi : IUserIntegrationApi
    {
        private const string UsersUrl = "api/users";

        private readonly HttpClient _httpClient;

        public UserIntegrationApi(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<IReadOnlyCollection<IdentityUserDto>> GetUsers()
        {
            var requestUri = UsersUrl;

            var response = await _httpClient.GetAsync(requestUri);

            response.EnsureSuccessStatusCode();

            var responseString = await response.Content.ReadAsStringAsync();

            var userDatas = JsonConvert.DeserializeObject<IReadOnlyCollection<IdentityUserDto>>(responseString);

            return userDatas ?? new List<IdentityUserDto>();
        }
    }
}
