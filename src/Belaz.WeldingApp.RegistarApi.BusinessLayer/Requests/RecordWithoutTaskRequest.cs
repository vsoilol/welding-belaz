using System.Text.Json.Serialization;
using AutoMapper;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.ProductInfo;
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
    
    /*
    public void Mapping(Profile profile)
    {
        profile.CreateMap<RecordWithoutTaskRequest, WeldingRecord>()
            .ForMember(dto => dto.UserInfo,
                opt => opt
                    .MapFrom(x => x));
    }*/
}