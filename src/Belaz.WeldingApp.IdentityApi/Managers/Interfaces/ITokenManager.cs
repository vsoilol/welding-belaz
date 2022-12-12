using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Belaz.WeldingApp.IdentityApi.Presenters.Models;

namespace Belaz.WeldingApp.IdentityApi.Managers.Interfaces
{
    public interface ITokenManager
    {
        AuthenticationResult GenerateAuthenticationResultForUser(UserData user);
    }
}
