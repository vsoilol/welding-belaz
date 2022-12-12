using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Models;
using Newtonsoft.Json;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi
{
    public class UserIntergrationApi : IUserIntergrationApi
    {
        private const string UsersUrl = "/users";

        private readonly HttpClient _httpClient;

        public UserIntergrationApi(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<IReadOnlyCollection<UserData>> GetUsers()
        {
            var requestUri = UsersUrl;

            var response = await _httpClient.GetAsync(requestUri);

            response.EnsureSuccessStatusCode();

            var responseString = await response.Content.ReadAsStringAsync();

            var userDatas = JsonConvert.DeserializeObject<IReadOnlyCollection<UserData>>(responseString);

            if (userDatas == null)
            {
                return new List<UserData>();
            }

            return userDatas;
        }
    }
}
