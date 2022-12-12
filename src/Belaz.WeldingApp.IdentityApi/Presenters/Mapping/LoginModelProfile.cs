using AutoMapper;
using Belaz.WeldingApp.IdentityApi.Managers.Models;
using Belaz.WeldingApp.IdentityApi.Presenters.Models;

namespace Belaz.WeldingApp.IdentityApi.Presenters.Mapping
{
    public class LoginModelProfile : Profile
    {
        public LoginModelProfile()
        {
            CreateMap<LoginModel, LoginModelContract>();
            CreateMap<LoginModelContract, LoginModel>();

            CreateMap<LoginResponse, LoginResponseContract>();
        }
    }
}
