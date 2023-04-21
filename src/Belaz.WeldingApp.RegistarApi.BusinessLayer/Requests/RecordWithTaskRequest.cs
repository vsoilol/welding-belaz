using System.Text.Json.Serialization;
using AutoMapper;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Mappings;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;

public class RecordWithTaskRequest : IMapTo<WeldingRecord>
{
    [JsonPropertyName("tID")]
    public Guid TaskId { get; set; }

    [JsonPropertyName("PasN")]
    public int WeldPassageNumber { get; set; }

    [JsonPropertyName("preTemp")]
    public double PreheatingTemperature { get; set; }

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
        profile
            .CreateMap<RecordWithTaskRequest, WeldingRecord>()
            .ForMember(dto => dto.WeldingEquipmentId, opt => opt.MapFrom(x => x.WeldingEquipmentId))
            .ForMember(dto => dto.WelderId, opt => opt.MapFrom(x => x.WelderId))
            .ForMember(dto => dto.Date, opt => opt.MapFrom(x => x.StartDateTime.Date))
            .ForMember(
                dto => dto.WeldingStartTime,
                opt => opt.MapFrom(x => x.StartDateTime.TimeOfDay)
            )
            .ForMember(dto => dto.WeldingCurrentValues, opt => opt.MapFrom(x => x.Amperages))
            .ForMember(dto => dto.ArcVoltageValues, opt => opt.MapFrom(x => x.Voltages));
    }
}
