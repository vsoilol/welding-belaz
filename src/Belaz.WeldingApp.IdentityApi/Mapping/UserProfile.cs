using AutoMapper;
using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.IdentityApi.Contracts.Responses.User;

namespace Belaz.WeldingApp.IdentityApi.Mapping;

public class UserProfile : Profile
{
    public UserProfile()
    {
        CreateMap<UserData, UserDto>()
            .ForMember(
                x => x.Role,
                opt => opt.MapFrom(x => x.UserRoles.Select(_ => _.Role).FirstOrDefault()!.Name)
            );
    }
}
