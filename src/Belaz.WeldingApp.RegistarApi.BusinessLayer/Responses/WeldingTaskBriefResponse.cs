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
    public int SeamNumber { get; set; }

    [JsonPropertyName("L")]
    public int SeamLength { get; set; }

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
            .ForMember(dto => dto.SeamLength, opt => opt.MapFrom(x => x.Seam.Length));
    }
}