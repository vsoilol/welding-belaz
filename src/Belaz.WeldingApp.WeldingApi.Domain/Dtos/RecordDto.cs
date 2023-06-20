using AutoMapper;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Welder;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos;

public class RecordDto : IMapFrom<WeldingRecord>
{
    public Guid Id { get; set; }
    
    public int? SequenceNumber { get; set; }

    public string Date { get; set; } = null!;

    public string WeldingStart { get; set; } = null!;

    /// <summary>
    /// Продолжительность сварки в секундах
    /// </summary>
    public int WeldingDuration { get; set; }

    /// <summary>
    /// Значения сварочного тока
    /// </summary>
    public double[] WeldingCurrentValues { get; set; } = null!;

    /// <summary>
    /// Значения напряжения на дуге
    /// </summary>
    public double[] ArcVoltageValues { get; set; } = null!;

    public WelderBriefDto Welder { get; set; } = null!;

    public UserFullNameDto Master { get; set; } = null!;

    public int? WeldingTaskNumber { get; set; }
    
    public int? SeamNumber { get; set; }

    public WeldingEquipmentBriefDto WeldingEquipment { get; set; } = null!;

    /// <summary>
    /// Есть ли отклонения
    /// </summary>
    public bool AreDeviations { get; set; }

    /// <summary>
    /// Сварочный ток min
    /// </summary>
    public double? WeldingCurrentMin { get; set; }

    /// <summary>
    /// Сварочный ток max
    /// </summary>
    public double? WeldingCurrentMax { get; set; }

    /// <summary>
    /// Напряжения на дуге min
    /// </summary>
    public double? ArcVoltageMin { get; set; }

    /// <summary>
    /// Напряжения на дуге max
    /// </summary>
    public double? ArcVoltageMax { get; set; }
    
    public double WeldingCurrentAverage { get; set; }
    
    public double ArcVoltageAverage { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<WeldingRecord, RecordDto>()
            .ForMember(dto => dto.Date, opt => opt.MapFrom(x => x.Date.ToDayInfoString()))
            .ForMember(
                dto => dto.WeldingStart,
                opt => opt.MapFrom(x => x.WeldingStartTime.ToHoursMinutesSecondsString())
            )
            .ForMember(
                dto => dto.Master,
                opt =>
                    opt.MapFrom(x =>
                        x.WeldPassage!.WeldingTask.Master!.UserInfo ?? x.Master!.UserInfo)
            )
            .ForMember(
                dto => dto.WeldingDuration,
                opt => opt.MapFrom(x => x.WeldingEndTime.Subtract(x.WeldingStartTime).Seconds)
            )
            .ForMember(dto => dto.WeldingTaskNumber,
                opt =>
                    opt.MapFrom(x => x.WeldPassage!.WeldingTask.Number))
            .ForMember(dto => dto.SeamNumber,
                opt =>
                    opt.MapFrom(x => x.WeldPassage!.WeldingTask.SeamAccount.Seam.Number))
            .ForMember(
                dto => dto.AreDeviations,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.WeldPassage != null
                                ? ((x.WeldPassage!.IsEnsuringCurrentAllowance != null
                                    && !(bool)x.WeldPassage.IsEnsuringCurrentAllowance)
                                   || (x.WeldPassage.IsEnsuringTemperatureAllowance != null
                                       && !(bool)x.WeldPassage.IsEnsuringTemperatureAllowance)
                                   || (x.WeldPassage.IsEnsuringVoltageAllowance != null
                                       && !(bool)x.WeldPassage.IsEnsuringVoltageAllowance))
                                : ((x.IsEnsuringCurrentAllowance != null && !(bool)x.IsEnsuringCurrentAllowance)
                                   ||
                                   (x.IsEnsuringVoltageAllowance != null && !(bool)x.IsEnsuringVoltageAllowance))
                    )
            )
            .ForMember(
                dto => dto.WeldingCurrentMin,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.WeldPassage != null
                                ? x.WeldPassage.WeldingTask.SeamAccount.Seam
                                    .TechnologicalInstruction!.WeldPassageInstructions
                                    .FirstOrDefault(_ => _.Number == x.WeldPassage.Number)!.WeldingCurrentMin
                                : x.WeldingRecordLimit.WeldingCurrentMin
                    )
            )
            .ForMember(
                dto => dto.WeldingCurrentMax,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.WeldPassage != null
                                ? x.WeldPassage.WeldingTask.SeamAccount.Seam
                                    .TechnologicalInstruction!.WeldPassageInstructions
                                    .FirstOrDefault(_ => _.Number == x.WeldPassage.Number)!.WeldingCurrentMax
                                : x.WeldingRecordLimit.WeldingCurrentMax
                    )
            )
            .ForMember(
                dto => dto.ArcVoltageMin,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.WeldPassage != null
                                ? x.WeldPassage.WeldingTask.SeamAccount.Seam
                                    .TechnologicalInstruction!.WeldPassageInstructions
                                    .FirstOrDefault(_ => _.Number == x.WeldPassage.Number)!.ArcVoltageMin
                                : x.WeldingRecordLimit.ArcVoltageMin
                    )
            )
            .ForMember(
                dto => dto.ArcVoltageMax,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.WeldPassage != null
                                ? x.WeldPassage.WeldingTask.SeamAccount.Seam
                                    .TechnologicalInstruction!.WeldPassageInstructions
                                    .FirstOrDefault(_ => _.Number == x.WeldPassage.Number)!.ArcVoltageMax
                                : x.WeldingRecordLimit.ArcVoltageMax
                    )
            );
    }
}