using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Common;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Chief;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.Mapping
{
    public class ChiefProfile : Profile
    {
        public ChiefProfile()
        {
            CreateMap<Chief, ChiefDto>()
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
                    .MapFrom(x => x.UserInfo.ProductionArea))
            .ForMember(dto => dto.WeldingEquipment,
                opt => opt
                    .MapFrom(x => x.WeldingEquipment));

            CreateMapCreateUserWithEquipmentRequestToChief();
            CreateMapUpdateUserWithEquipmentRequestToChief();
        }
        
        private void CreateMapCreateUserWithEquipmentRequestToChief()
        {
            CreateMap<CreateUserWithEquipmentRequest, Chief>()
                .ForMember(dto => dto.UserInfo,
                    opt => opt
                        .MapFrom(x => x));
        }

        private void CreateMapUpdateUserWithEquipmentRequestToChief()
        {
            CreateMap<UpdateUserWithEquipmentRequest, Chief>()
                .ForMember(dto => dto.UserInfo,
                    opt => opt
                        .MapFrom(x => x));
        }
    }
}
