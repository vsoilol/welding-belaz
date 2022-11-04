using Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Models;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Interfaces
{
    public interface IAuthPresenter
    {
        public Task<LoginResponseContract> Register(RegisterModelContract registerContract);

        public Task<LoginResponseContract> Login(LoginModelContract loginContract);

        public Task<bool> Logout();
    }
}
