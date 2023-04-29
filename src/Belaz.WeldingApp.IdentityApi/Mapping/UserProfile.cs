using AutoMapper;
using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.IdentityApi.Contracts.Responses.User;

namespace Belaz.WeldingApp.IdentityApi.Mapping;

public class UserProfile : Profile
{
    public UserProfile()
    {
        CreateMap<UserData, UserDto>();
    }
}
