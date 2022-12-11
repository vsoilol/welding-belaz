using AutoMapper;
using Belaz.WeldingApp.IdentityApi.WebApi.Managers.Interfaces;
using Belaz.WeldingApp.IdentityApi.WebApi.Managers.Models;
using Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Interfaces;
using Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Models;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Presenters
{
    public class AuthPresenter : IAuthPresenter
    {
        private readonly IAuthManager _authManager;
        private readonly IMapper _mapper;

        public AuthPresenter(IAuthManager authManager, IMapper mapper)
        {
            _authManager = authManager;
            _mapper = mapper;
        }

        public async Task<AuthenticationResult> Login(LoginModelContract loginContract)
        {
            var login = _mapper.Map<LoginModel>(loginContract);

            var response = await _authManager.Login(login);

            return response;
        }

        public async Task<AuthenticationResult> Register(RegisterModelContract registerContract)
        {
            var register = _mapper.Map<RegisterModel>(registerContract);

            var response = await _authManager.Register(register);

            return response;
        }

        public async Task<bool> Logout()
        {
            return await _authManager.Logout();
        }

    }
}
