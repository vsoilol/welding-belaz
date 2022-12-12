using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Identity;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Implementations;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Belaz.WeldingApp.IntegrationApi.Managers.Interfaces;

namespace Belaz.WeldingApp.IntegrationApi.Managers.Implementations
{
    public class UserManager : IUserManager
    {
        private readonly IUserIntegrationApi _userIntegrationApi;

        public UserManager(IUserIntegrationApi userIntegrationApi)
        {
            _userIntegrationApi = userIntegrationApi;
        }

        public Task<IReadOnlyCollection<IdentityUserDto>> GetUsers()
        {
            return _userIntegrationApi.GetUsers();
        }
    }
}
