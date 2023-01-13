using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Common;
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
        CreateMapCreateUserRequestToUserData();
        CreateMapUpdateUserRequestToUserData();
        CreateMapCreateUserWithEquipmentRequestToUserData();
        CreateMapUpdateUserWithEquipmentRequestToUserData();
    }

    private void CreateMapCreateWelderRequestToUserData()
    {
        CreateMap<CreateWelderRequest, UserData>();
    }
    
    private void CreateMapUpdateWelderRequestToUserData()
    {
        CreateMap<UpdateWelderRequest, UserData>();
    }

    private void CreateMapCreateUserRequestToUserData()
    {
        CreateMap<CreateUserRequest, UserData>();
    }
    
    private void CreateMapUpdateUserRequestToUserData()
    {
        CreateMap<UpdateUserRequest, UserData>();
    }
    
    private void CreateMapCreateUserWithEquipmentRequestToUserData()
    {
        CreateMap<CreateUserWithEquipmentRequest, UserData>();
    }
    
    private void CreateMapUpdateUserWithEquipmentRequestToUserData()
    {
        CreateMap<UpdateUserWithEquipmentRequest, UserData>();
    }
}
