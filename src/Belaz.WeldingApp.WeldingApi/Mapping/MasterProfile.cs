using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Master;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.Mapping
{
    public class MasterProfile : Profile
    {
        public MasterProfile()
        {
            CreateMap<Welder, MasterDto>()
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
                    .MapFrom(x => x.UserInfo.LastName));
        }
    }
}
