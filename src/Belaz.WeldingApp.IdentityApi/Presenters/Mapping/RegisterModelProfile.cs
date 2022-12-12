using AutoMapper;
using Belaz.WeldingApp.IdentityApi.Managers.Models;
using Belaz.WeldingApp.IdentityApi.Presenters.Models;

namespace Belaz.WeldingApp.IdentityApi.Presenters.Mapping
{
    public class RegisterModelProfile : Profile
    {
        public RegisterModelProfile()
        {
            CreateMap<RegisterModelContract, RegisterModel>();
        }
    }
}
