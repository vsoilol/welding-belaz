using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Models;
using Belaz.WeldingApp.IntegrationApi.Managers.Interfaces;

namespace Belaz.WeldingApp.IntegrationApi.Managers
{
    public class UserManager : IUserManager
    {
        public Task<IReadOnlyCollection<UserData>> GetUsers()
        {
            throw new NotImplementedException();
        }
    }
}
