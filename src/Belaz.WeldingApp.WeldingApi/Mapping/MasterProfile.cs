using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Common;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Master;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.Mapping
{
    public class MasterProfile : Profile
    {
        public MasterProfile()
        {
            CreateMap<Master, MasterDto>()
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
            CreateMapCreateUserWithEquipmentRequestToMaster();
            CreateMapUpdateUserWithEquipmentRequestToMaster();
        }

        private void CreateMapCreateUserWithEquipmentRequestToMaster()
        {
            CreateMap<CreateUserWithEquipmentRequest, Master>()
                .ForMember(dto => dto.UserInfo,
                    opt => opt
                        .MapFrom(x => x));
        }

        private void CreateMapUpdateUserWithEquipmentRequestToMaster()
        {
            CreateMap<UpdateUserWithEquipmentRequest, Master>()
                .ForMember(dto => dto.UserInfo,
                    opt => opt
                        .MapFrom(x => x));
        }
    }
}