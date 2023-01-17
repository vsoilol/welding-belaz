using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Welder;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Welder;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;

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
            .ForMember(dto => dto.Workshop,
                opt => opt
                    .MapFrom(x => x.UserInfo.ProductionArea.Workshop))
            .ForMember(dto => dto.ProductionArea,
                opt => opt
                    .MapFrom(x => x.UserInfo.ProductionArea))
            .ForMember(dto => dto.Workplace,
                opt => opt
                    .MapFrom(x => x.Workplace));

        CreateMapForCreateWelderRequestToWelder();
        CreateMapForUpdateWelderRequestToWelder();
    }

    private void CreateMapForCreateWelderRequestToWelder()
    {
        CreateMap<CreateWelderRequest, Welder>()
            .ForMember(dto => dto.UserInfo,
                opt => opt
                    .MapFrom(x => x))
            .ForMember(dto => dto.WeldingEquipments,
                opt => opt
                    .MapFrom(x => x.WeldingEquipmentIds
                        .Select(_ => new WeldingEquipment
                        {
                            Id = _
                        })));
    }

    private void CreateMapForUpdateWelderRequestToWelder()
    {
        CreateMap<UpdateWelderRequest, Welder>()
            .ForMember(dto => dto.UserInfo,
                opt => opt
                    .MapFrom(x => x))
            .ForMember(dto => dto.WeldingEquipments,
                opt => opt
                    .MapFrom(x => x.WeldingEquipmentIds
                        .Select(_ => new WeldingEquipment
                        {
                            Id = _
                        })));
    }
}