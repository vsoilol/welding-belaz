using System.Text.Json.Serialization;
using AutoMapper;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Belaz.WeldingApp.RegistarApi.Domain.Mappings;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Responses;

public class WeldingTaskBriefResponse : IMapFrom<WeldingTaskDto>
{
    [JsonPropertyName("tID")]
    public Guid WeldingTaskId { get; set; }

    [JsonPropertyName("EplID")]
    public Guid WelderId { get; set; }

    [JsonPropertyName("EqpID")]
    public Guid EquipmentId { get; set; }

    [JsonPropertyName("ProdT")]
    public string ProductName { get; set; } = null!;

    [JsonPropertyName("AsmT")]
    public string? KnotName { get; set; }

    [JsonPropertyName("DtlT")]
    public string? DetailName { get; set; }

    [JsonPropertyName("WeldN")] 
    public string SeamNumber { get; set; } = null!;
    
    [JsonPropertyName("SeqNum")] 
    public string SequenceNumber { get; set; } = null!;

    [JsonPropertyName("L")]
    public int SeamLength { get; set; }

    [JsonPropertyName("ProdN")]
    public string ProductNumber { get; set; } = null!;

    [JsonPropertyName("AsmN")]
    public string? KnotNumber { get; set; }

    [JsonPropertyName("DtlN")]
    public string? DetailNumber { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<WeldingTaskDto, WeldingTaskBriefResponse>()
            .ForMember(dto => dto.WeldingTaskId, opt => opt.MapFrom(x => x.Id))
            .ForMember(dto => dto.WelderId, opt => opt.Ignore())
            .ForMember(dto => dto.EquipmentId, opt => opt.Ignore())
            .ForMember(dto => dto.ProductName, opt => opt.MapFrom(x => x.Seam.Product.Name))
            .ForMember(dto => dto.KnotName, opt => opt.MapFrom(x => x.Seam.Knot!.Name))
            .ForMember(dto => dto.DetailName, opt => opt.MapFrom(x => x.Seam.Detail!.Name))
            .ForMember(dto => dto.SeamNumber, opt => opt.MapFrom(x => x.Seam.Number))
            .ForMember(dto => dto.SeamLength, opt => opt.MapFrom(x => x.Seam.Length))
            .ForMember(dto => dto.ProductNumber, opt => opt.MapFrom(x => x.Seam.Product.Number))
            .ForMember(dto => dto.KnotNumber, opt => opt.MapFrom(x => x.Seam.Knot!.Number))
            .ForMember(dto => dto.DetailNumber, opt => 
                opt.MapFrom(x => x.Seam.Detail!.Number))
            .ForMember(dto => dto.SequenceNumber, opt => 
                opt.MapFrom(x => ""));
    }
}
