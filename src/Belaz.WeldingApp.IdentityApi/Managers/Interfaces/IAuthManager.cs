using Belaz.WeldingApp.IdentityApi.Contracts.Requests.Identity;
using Belaz.WeldingApp.IdentityApi.Contracts.Responses.Identity;

namespace Belaz.WeldingApp.IdentityApi.Managers.Interfaces
{
    public interface IAuthManager
    {
        Task<AuthSuccessResponse> Register(RegisterModelContract registerData);

        Task<AuthSuccessResponse> Login(LoginModelContract login);

        Task<bool> Logout();
    }
}
