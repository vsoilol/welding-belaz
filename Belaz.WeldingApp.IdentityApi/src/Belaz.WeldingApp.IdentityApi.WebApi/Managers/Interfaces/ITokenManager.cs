using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Models;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Managers.Interfaces
{
    public interface ITokenManager
    {
        AuthenticationResult GenerateAuthenticationResultForUser(UserData user);
    }
}
