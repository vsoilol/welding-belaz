using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.WeldingEquipmentInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;

public class UpdateWeldingEquipmentDowntimeRequest : IMapTo<WeldingEquipmentConditionTime>
{
    public Guid Id { get; set; }

    public Guid WeldingEquipmentId { get; set; }

    /// <summary>
    /// Причина простоя
    /// </summary>
    public Guid DowntimeReasonId { get; set; }

    public string Date { get; set; } = null!;

    public string StartConditionTime { get; set; } = null!;

    /// <summary>
    /// Сколько оборудование находиться в данном состоянии в минутах
    /// </summary>
    public int Time { get; set; }

    public void Mapping(Profile profile)
    {
        profile.CreateMap<UpdateWeldingEquipmentDowntimeRequest, WeldingEquipmentConditionTime>()
            .ForMember(dto => dto.Condition,
                opt => opt
                    .MapFrom(x => Condition.ForcedDowntime))
            .ForMember(dto => dto.Date,
                opt => opt
                    .MapFrom(x => x.Date.ToDateTime()))
            .ForMember(dto => dto.StartConditionTime,
                opt => opt
                    .MapFrom(x => x.StartConditionTime.ToTimeSpan()));
    }
}