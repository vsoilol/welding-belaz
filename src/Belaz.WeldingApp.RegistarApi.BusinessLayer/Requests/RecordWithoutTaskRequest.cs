using System.Text.Json.Serialization;
using AutoMapper;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Mappings;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;

public class RecordWithoutTaskRequest : IMapTo<WeldingRecord>
{
    [JsonPropertyName("RegID")]
    public string RegistarId { get; set; } = null!;

    [JsonPropertyName("EqpID")]
    public Guid WeldingEquipmentId { get; set; }

    [JsonPropertyName("EplID")]
    public Guid WelderId { get; set; }

    [JsonPropertyName("SDT")]
    public DateTime StartDateTime { get; set; }

    [JsonPropertyName("Amp")]
    public double[] Amperages { get; set; } = null!;
    
    [JsonPropertyName("Volt")]
    public double[] Voltages { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile.CreateMap<RecordWithoutTaskRequest, WeldingRecord>()
            .ForMember(dto => dto.WeldingEquipmentId,
                opt => opt
                    .MapFrom(x => x.WeldingEquipmentId))
            .ForMember(dto => dto.WelderId,
                opt => opt
                    .MapFrom(x => x.WelderId))
            .ForMember(dto => dto.WeldingStartTime,
                opt => opt
                    .MapFrom(x => x.WelderId))
            .ForMember(dto => dto.Date,
                opt => opt
                    .MapFrom(x => x.StartDateTime.Date))
            .ForMember(dto => dto.WeldingStartTime,
                opt => opt
                    .MapFrom(x => x.StartDateTime.TimeOfDay))
            .ForMember(dto => dto.WeldingCurrentValues,
                opt => opt
                    .MapFrom(x => x.Amperages))
            .ForMember(dto => dto.ArcVoltageValues,
                opt => opt
                    .MapFrom(x => x.Voltages));
    }
}