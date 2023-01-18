using System.Globalization;
using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Extensions;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class WeldingEquipmentProfile : Profile
{
    public WeldingEquipmentProfile()
    {
        WeldingEquipmentToWeldingEquipmentBriefDto();
        WeldingEquipmentToWeldingEquipmentDto();
        WeldingEquipmentConditionTimeToWeldingEquipmentDowntimeDto();

        CreateMap<CreateEquipmentRequest, WeldingEquipment>()
            .ForMember(dto => dto.NextAttestationDate,
                opt => opt
                    .MapFrom(x => DateTime.ParseExact(x.NextAttestationDate, "dd.MM.yyyy", CultureInfo.InvariantCulture)))
            .ForMember(dto => dto.CommissioningDate,
                opt => opt
                    .MapFrom(x => DateTime.ParseExact(x.CommissioningDate, "dd.MM.yyyy", CultureInfo.InvariantCulture)));
        
        CreateMap<UpdateEquipmentRequest, WeldingEquipment>()
            .ForMember(dto => dto.NextAttestationDate,
                opt => opt
                    .MapFrom(x => DateTime.ParseExact(x.NextAttestationDate, "dd.MM.yyyy", CultureInfo.InvariantCulture)))
            .ForMember(dto => dto.CommissioningDate,
                opt => opt
                    .MapFrom(x => DateTime.ParseExact(x.CommissioningDate, "dd.MM.yyyy", CultureInfo.InvariantCulture)));
    }

    private void WeldingEquipmentToWeldingEquipmentBriefDto()
    {
        CreateMap<WeldingEquipment, WeldingEquipmentBriefDto>()
            .ForMember(dto => dto.CommissioningDate,
                opt => opt
                    .MapFrom(x => x.CommissioningDate.ToDayInfoString()));
    }

    private void WeldingEquipmentToWeldingEquipmentDto()
    {
        CreateMap<WeldingEquipment, WeldingEquipmentDto>()
            .ForMember(dto => dto.CommissioningDate,
                opt => opt
                    .MapFrom(x => x.CommissioningDate.ToDayInfoString()))
            .ForMember(dto => dto.Post,
                opt => opt
                    .MapFrom(x => x.Post))
            .ForMember(dto => dto.NextAttestationDate,
                opt => opt
                    .MapFrom(x => x.NextAttestationDate.ToDayInfoString()))
            .ForMember(dto => dto.ResponsiblePerson,
                opt => opt
                    .MapFrom(x => x.Welder.UserInfo))
            .ForMember(dto => dto.ActivationDuration,
                opt => opt
                    .MapFrom(x => x.WeldingEquipmentConditionTime
                        .Where(_ => _.Condition == Condition.AtWork)
                        .Sum(_ => _.Time)));
    }

    private void WeldingEquipmentConditionTimeToWeldingEquipmentDowntimeDto()
    {
        CreateMap<WeldingEquipmentConditionTime, WeldingEquipmentDowntimeDto>()
            .ForMember(dto => dto.StartConditionTime,
                opt => opt
                    .MapFrom(x => x.StartConditionTime.ToHoursMinutesString()))
            .ForMember(dto => dto.DowntimeReason,
                opt => opt
                    .MapFrom(x => x.DowntimeReason.Reason))
            .ForMember(dto => dto.Date,
                opt => opt
                    .MapFrom(x => x.Date.ToDayInfoString()))
            .ForMember(dto => dto.WeldingEquipment,
                opt => opt
                    .MapFrom(x => x.WeldingEquipment));
    }
}
