using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos;

public class RecordDto : IMapFrom<WeldingRecord>
{
    public string Date { get; set; } = null!;
    
    public string WeldingStart { get; set; } = null!;

    /// <summary>
    /// Продолжительность сварки в секундах
    /// </summary>
    public int WeldingDuration { get; set; }
    
    /// <summary>
    /// Температура предварительного нагрева
    /// </summary>
    public int PreheatingTemperature { get; set; }
    
    /// <summary>
    /// Значения сварочного тока
    /// </summary>
    public double[] WeldingCurrentValues { get; set; } = null!;

    /// <summary>
    /// Значения напряжения на дуге
    /// </summary>
    public double[] ArcVoltageValues { get; set; } = null!;

    public WelderDto Welder { get; set; } = null!;
    
    public MasterDto Master { get; set; } = null!;
    
    public WeldingEquipmentBriefDto WeldingEquipment { get; set; } = null!;

    public WeldingTaskDto? WeldingTask { get; set; }
    
    public void Mapping(Profile profile)
    {
        profile.CreateMap<WeldingRecord, RecordDto>()
            .ForMember(dto => dto.Date,
                opt => opt
                    .MapFrom(x => x.Date.ToDayInfoString()))
            .ForMember(dto => dto.WeldingStart,
                opt => opt
                    .MapFrom(x => x.WeldingStartTime.ToHoursMinutesSecondsString()))
            .ForMember(dto => dto.WeldingDuration,
                opt => opt
                    .MapFrom(x => x.WeldingEndTime.Subtract(x.WeldingStartTime).Seconds))
            .ForMember(dto => dto.WeldingTask,
                opt => opt
                    .MapFrom(x => x.WeldPassage!.WeldingTask));
    }
}