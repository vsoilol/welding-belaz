using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Chief;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.Mapping
{
    public class ChiefProfile : Profile
    {
        public ChiefProfile()
        {
            CreateMap<Welder, ChiefDto>()
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
