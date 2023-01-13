using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Welder;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.UserData;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.IdentityUser;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class UserDataProfile : Profile
{
    public UserDataProfile()
    {
        CreateMap<UserData, UserFullName>();
        CreateMapCreateWelderRequestToUserData();
    }

    private void CreateMapCreateWelderRequestToUserData()
    {
        CreateMap<CreateWelderRequest, UserData>()
            .ForMember(dto => dto.UserName,
                opt => opt
                    .MapFrom(x => $"{x.FirstName}_{x.MiddleName}_{x.LastName}"))
            .ForMember(dto => dto.Email,
                opt => opt
                    .MapFrom(x => $"{x.FirstName}_{x.MiddleName}_{x.LastName}@email.com"));
    }
}
