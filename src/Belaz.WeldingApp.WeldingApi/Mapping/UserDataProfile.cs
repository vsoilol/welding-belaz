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
        CreateMapUpdateWelderRequestToUserData();
    }

    private void CreateMapCreateWelderRequestToUserData()
    {
        CreateMap<CreateWelderRequest, UserData>();
    }
    
    private void CreateMapUpdateWelderRequestToUserData()
    {
        CreateMap<UpdateWelderRequest, UserData>();
    }
}
