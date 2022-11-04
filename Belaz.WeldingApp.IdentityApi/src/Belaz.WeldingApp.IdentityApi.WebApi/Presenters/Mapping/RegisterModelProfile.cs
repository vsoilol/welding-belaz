using AutoMapper;
using Belaz.WeldingApp.IdentityApi.WebApi.Managers.Models;
using Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Models;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Mapping
{
    public class RegisterModelProfile : Profile
    {
        public RegisterModelProfile()
        {
            CreateMap<RegisterModelContract, RegisterModel>();
        }
    }
}
