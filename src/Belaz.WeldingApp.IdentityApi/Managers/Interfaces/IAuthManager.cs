using Belaz.WeldingApp.IdentityApi.Managers.Models;
using Belaz.WeldingApp.IdentityApi.Presenters.Models;

namespace Belaz.WeldingApp.IdentityApi.Managers.Interfaces
{
    public interface IAuthManager
    {
        Task<AuthenticationResult> Register(RegisterModel registerData);

        Task<AuthenticationResult> Login(LoginModel login);

        Task<bool> Logout();
    }
}
