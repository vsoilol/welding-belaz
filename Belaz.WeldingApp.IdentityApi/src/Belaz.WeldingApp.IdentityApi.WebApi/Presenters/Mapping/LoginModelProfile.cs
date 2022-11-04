using AutoMapper;
using Belaz.WeldingApp.IdentityApi.WebApi.Managers.Models;
using Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Models;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Mapping
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
