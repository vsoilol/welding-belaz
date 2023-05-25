﻿using AutoMapper;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Master;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Welder;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos;

public class RecordDto : IMapFrom<WeldingRecord>
{
    public Guid Id { get; set; }

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

    public WeldingEquipmentBriefDto WeldingEquipment { get; set; } = null!;

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
            .ForMember(dto => dto.WeldingTaskNumber, opt => opt.MapFrom(x => x.WeldPassage!.WeldingTask.Number));
    }
}