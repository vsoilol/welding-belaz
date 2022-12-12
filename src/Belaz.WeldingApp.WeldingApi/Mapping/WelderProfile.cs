using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Welder;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class WelderProfile : Profile
{
    public WelderProfile()
    {
        CreateMap<Welder, WelderDto>()
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
            .ForMember(dto => dto.WorkshopName,
                opt => opt
                    .MapFrom(x => x.UserInfo.ProductionArea.Workshop.Name))
            .ForMember(dto => dto.ProductionAreaName,
                opt => opt
                    .MapFrom(x => x.UserInfo.ProductionArea.Name))
            .ForMember(dto => dto.WorkplaceNumber,
                opt => opt
                    .MapFrom(x => x.Workplace != null ? x.Workplace!.Number : (int?)null));
    }
}
