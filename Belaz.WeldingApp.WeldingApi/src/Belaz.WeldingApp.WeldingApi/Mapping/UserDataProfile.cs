using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.UserData;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.IdentityUser;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class UserDataProfile : Profile
{
    public UserDataProfile()
    {
        CreateMap<UserData, UserFullName>();
    }
}
