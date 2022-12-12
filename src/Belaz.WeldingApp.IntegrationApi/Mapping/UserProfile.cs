using AutoMapper;
using Belaz.WeldingApp.IntegrationApi.Contracts.Requests.User;
using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Identity;

namespace Belaz.WeldingApp.IntegrationApi.Mapping;

public class UserProfile : Profile
{
    public UserProfile()
    {
        CreateMap<CreateUserRequest, IdentityUserDto>()
            .ForMember(dto => dto.Id,
                opt => opt
                    .MapFrom(x => Guid.Empty));
    }
}
