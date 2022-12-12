using AutoMapper;
using Belaz.WeldingApp.IntegrationApi.Contracts.Requests.User;
using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Identity;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Newtonsoft.Json;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Implementations
{
    public class UserIntegrationApi : IUserIntegrationApi
    {
        private const string UsersUrl = "api/users";

        private readonly HttpClient _httpClient;
        private readonly IMapper _mapper;

        public UserIntegrationApi(HttpClient httpClient, IMapper mapper)
        {
            _httpClient = httpClient;
            _mapper = mapper;
        }

        public async Task<List<IdentityUserDto>> GetUsers()
        {
            var requestUri = UsersUrl;

            var response = await _httpClient.GetAsync(requestUri);

            response.EnsureSuccessStatusCode();

            var responseString = await response.Content.ReadAsStringAsync();

            var userDatas = JsonConvert.DeserializeObject<IReadOnlyCollection<IdentityUserDto>>(responseString);

            return userDatas?.ToList() ?? new List<IdentityUserDto>();
        }

        public async Task<IdentityUserDto> GetByIdAsync(Guid id)
        {
            var requestUri = UsersUrl + $"/{id}";

            var response = await _httpClient.GetAsync(requestUri);

            response.EnsureSuccessStatusCode();

            var responseString = await response.Content.ReadAsStringAsync();

            var userData = JsonConvert.DeserializeObject<IdentityUserDto>(responseString);

            return userData ?? new IdentityUserDto();
        }

        public async Task<IdentityUserDto> AddAsync(CreateUserRequest user)
        {
            var requestUri = UsersUrl;

            var content = JsonContent.Create(_mapper.Map<IdentityUserDto>(user));

            var response = await _httpClient.PostAsync(requestUri, content);

            response.EnsureSuccessStatusCode();

            var responseString = await response.Content.ReadAsStringAsync();

            var userData = JsonConvert.DeserializeObject<IdentityUserDto>(responseString);

            return userData ?? new IdentityUserDto();
        }

        public async Task<IdentityUserDto> UpdateAsync(Guid id, CreateUserRequest user)
        {
            var requestUri = UsersUrl + $"/{id}";

            var content = JsonContent.Create(_mapper.Map<IdentityUserDto>(user));

            var response = await _httpClient.PutAsync(requestUri, content);

            response.EnsureSuccessStatusCode();

            var responseString = await response.Content.ReadAsStringAsync();

            var userData = JsonConvert.DeserializeObject<IdentityUserDto>(responseString);

            return userData ?? new IdentityUserDto();
        }

        public async Task<Guid> DeleteAsync(Guid id)
        {
            var requestUri = UsersUrl + $"/{id}";

            var response = await _httpClient.DeleteAsync(requestUri);

            response.EnsureSuccessStatusCode();

            var responseString = await response.Content.ReadAsStringAsync();

            var userId = JsonConvert.DeserializeObject<Guid>(responseString);

            return userId;
        }
    }
}
