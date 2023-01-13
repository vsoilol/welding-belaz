using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Common;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Inspector;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.Mapping
{
    public class InspectorProfile : Profile
    {
        public InspectorProfile()
        {
            CreateMap<Inspector, InspectorDto>()
            .ForMember(dto => dto.RfidTag,
                opt => opt
                    .MapFrom(x => x.UserInfo.RfidTag))
            .ForMember(dto => dto.FirstName,
                opt => opt
                    .MapFrom(x => x.UserInfo.FirstName))
            .ForMember(dto => dto.MiddleName,
                opt => opt
                    .MapFrom(x => x.UserInfo.MiddleName))
            .ForMember(dto => dto.LastName,
                opt => opt
                    .MapFrom(x => x.UserInfo.LastName))
            .ForMember(dto => dto.ProductionArea,
                opt => opt
                    .MapFrom(x => x.UserInfo.ProductionArea));
            CreateMapCreateUserRequestToInspector();
            CreateMapUpdateUserRequestToInspector();
        }

        private void CreateMapCreateUserRequestToInspector()
        {
            CreateMap<CreateUserRequest, Inspector>()
                .ForMember(dto => dto.UserInfo,
                    opt => opt
                        .MapFrom(x => x));
        }
        
        private void CreateMapUpdateUserRequestToInspector()
        {
            CreateMap<UpdateUserRequest, Inspector>()
                .ForMember(dto => dto.UserInfo,
                    opt => opt
                        .MapFrom(x => x));
        }
    }
}
