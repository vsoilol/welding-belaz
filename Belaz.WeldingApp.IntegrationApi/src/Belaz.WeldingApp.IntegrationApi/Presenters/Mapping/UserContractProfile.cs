using AutoMapper;
using Belaz.WeldingApp.IntegrationApi.Managers.Models;
using Belaz.WeldingApp.IntegrationApi.Presenters.Models;

namespace Belaz.WeldingApp.IntegrationApi.Presenters.Mapping
{
    public class UserDataProfile : Profile
    {
        public UserDataProfile()
        {
            CreateMap<UserContract, User>();
            CreateMap<User, UserContract>();
        }
    }
}
