using AutoMapper;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Models;
using Belaz.WeldingApp.IntegrationApi.Managers.Models;

namespace Belaz.WeldingApp.IntegrationApi.Managers.Mapping
{
    public class UserDataProfile : Profile
    {
        public UserDataProfile()
        {
            CreateMap<User, UserData>();
            CreateMap<UserData, User>();
        }
    }
}
