using Belaz.WeldingApp.IdentityApi.WebApi.Managers.Models;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Managers.Interfaces
{
    public interface IAuthManager
    {
        Task<LoginResponse> Register(RegisterModel registerData);

        Task<LoginResponse> Login(LoginModel login);

        Task<bool> Logout();
    }
}
