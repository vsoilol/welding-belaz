using Belaz.WeldingApp.IdentityApi.WebApi.Managers.Models;
using Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Models;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Managers.Interfaces
{
    public interface IAuthManager
    {
        Task<AuthenticationResult> Register(RegisterModel registerData);

        Task<AuthenticationResult> Login(LoginModel login);

        Task<bool> Logout();
    }
}
