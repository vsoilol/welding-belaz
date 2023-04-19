using AutoMapper;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;

/// <summary>
/// Простои оборудования
/// </summary>
public class WeldingEquipmentDowntimeDto : IMapFrom<WeldingEquipmentConditionTime>
{
    public Guid Id { get; set; }

    public WeldingEquipmentBriefDto WeldingEquipment { get; set; } = null!;

    /// <summary>
    /// Причина простоя
    /// </summary>
    public string DowntimeReason { get; set; } = null!;

    public string Date { get; set; } = null!;

    public string StartConditionTime { get; set; } = null!;

    public double Time { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<WeldingEquipmentConditionTime, WeldingEquipmentDowntimeDto>()
            .ForMember(
                dto => dto.StartConditionTime,
                opt => opt.MapFrom(x => x.StartConditionTime.ToHoursMinutesString())
            )
            .ForMember(dto => dto.DowntimeReason, opt => opt.MapFrom(x => x.DowntimeReason!.Reason))
            .ForMember(dto => dto.Date, opt => opt.MapFrom(x => x.Date.ToDayInfoString()));
    }
}
