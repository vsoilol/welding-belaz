using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Inspector;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.Mapping
{
    public class InspectorProfile : Profile
    {
        public InspectorProfile()
        {
            CreateMap<Welder, InspectorDto>()
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
