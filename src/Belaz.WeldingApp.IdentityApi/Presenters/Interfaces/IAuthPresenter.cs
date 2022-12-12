using Belaz.WeldingApp.IdentityApi.Presenters.Models;

namespace Belaz.WeldingApp.IdentityApi.Presenters.Interfaces
{
    public interface IAuthPresenter
    {
        public Task<AuthenticationResult> Register(RegisterModelContract registerContract);

        public Task<AuthenticationResult> Login(LoginModelContract loginContract);

        public Task<bool> Logout();
    }
}
