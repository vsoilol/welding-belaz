using AutoMapper;
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
            .ForMember(dto => dto.NextAttestationDate,
                opt => opt
                    .MapFrom(x => x.NextAttestationDate.ToDayInfoString()))
            .ForMember(dto => dto.ResponsiblePerson,
                opt => opt
                    .MapFrom(x => x.Welder.UserInfo))
            .ForMember(dto => dto.ActivationDuration,
                opt => opt
                    .MapFrom(x => x.WeldingEquipmentWorkingShifts
                        .Where(_ => _.WeldingEquipmentConditionTime.Condition == Condition.AtWork)
                        .Sum(_ => _.WeldingEquipmentConditionTime.Time)));
    }

    private void WeldingEquipmentConditionTimeToWeldingEquipmentDowntimeDto()
    {
        CreateMap<WeldingEquipmentConditionTime, WeldingEquipmentDowntimeDto>()
            .ForMember(dto => dto.ChangeConditionTime,
                opt => opt
                    .MapFrom(x => x.ChangeConditionTime.ToHoursMinutesSecondsString()))
            .ForMember(dto => dto.WeldingEquipment,
                opt => opt
                    .MapFrom(x => x.WeldingEquipmentWorkingShift.WeldingEquipment));
    }
}
