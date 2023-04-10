using System.Text.Json.Serialization;
using AutoMapper;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Belaz.WeldingApp.RegistarApi.Domain.Mappings;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Responses;

public class WeldingTaskResponse : IMapFrom<WeldingTaskDto>
{
    [JsonPropertyName("tID")]
    public Guid WeldingTaskId { get; set; }

    [JsonPropertyName("EplID")]
    public Guid WelderId { get; set; }

    [JsonPropertyName("EqpID")]
    public Guid EquipmentId { get; set; }

    [JsonPropertyName("ProdID")]
    public Guid ProductId { get; set; }

    [JsonPropertyName("ProdT")]
    public string ProductName { get; set; } = null!;

    [JsonPropertyName("AsmID")]
    public Guid? KnotId { get; set; }

    [JsonPropertyName("AsmT")]
    public string? KnotName { get; set; }

    [JsonPropertyName("DtlID")]
    public Guid? DetailId { get; set; }

    [JsonPropertyName("DtlT")]
    public string? DetailName { get; set; }

    [JsonPropertyName("TechProcID")]
    public Guid TechnologicalProcessId { get; set; }

    [JsonPropertyName("TechProcN")]
    public string TechnologicalProcessNumber { get; set; } = null!;

    [JsonPropertyName("TechProcT")]
    public string TechnologicalProcessName { get; set; } = null!;

    [JsonPropertyName("TechInstID")]
    public Guid TechnologicalInstructionId { get; set; }

    [JsonPropertyName("TechInstrN")]
    public int TechnologicalInstructionNumber { get; set; }

    [JsonPropertyName("TechInstrT")]
    public string TechnologicalInstructionName { get; set; } = null!;

    [JsonPropertyName("WeldID")]
    public Guid SeamId { get; set; }

    [JsonPropertyName("WeldN")]
    public int SeamNumber { get; set; }

    [JsonPropertyName("L")]
    public int SeamLength { get; set; }

    [JsonPropertyName("passages")]
    public List<WeldPassageInstructionResponse> WeldPassageInstructions { get; set; } = null!;

    [JsonPropertyName("ProdN")]
    public string ProductNumber { get; set; } = null!;

    [JsonPropertyName("AsmN")]
    public string? KnotNumber { get; set; }

    [JsonPropertyName("DtlN")]
    public string? DetailNumber { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<WeldingTaskDto, WeldingTaskResponse>()
            .ForMember(dto => dto.WeldingTaskId, opt => opt.MapFrom(x => x.Id))
            .ForMember(dto => dto.WelderId, opt => opt.Ignore())
            .ForMember(dto => dto.EquipmentId, opt => opt.Ignore())
            .ForMember(dto => dto.ProductId, opt => opt.MapFrom(x => x.Seam.Product.Id))
            .ForMember(dto => dto.ProductName, opt => opt.MapFrom(x => x.Seam.Product.Name))
            .ForMember(dto => dto.KnotId, opt => opt.MapFrom(x => x.Seam.Knot!.Id))
            .ForMember(dto => dto.KnotName, opt => opt.MapFrom(x => x.Seam.Knot!.Name))
            .ForMember(dto => dto.DetailId, opt => opt.MapFrom(x => x.Seam.Detail!.Id))
            .ForMember(dto => dto.DetailName, opt => opt.MapFrom(x => x.Seam.Detail!.Name))
            .ForMember(
                dto => dto.TechnologicalProcessId,
                opt => opt.MapFrom(x => x.TechnologicalProcess.Id)
            )
            .ForMember(
                dto => dto.TechnologicalProcessName,
                opt => opt.MapFrom(x => x.TechnologicalProcess.Name)
            )
            .ForMember(
                dto => dto.TechnologicalProcessNumber,
                opt => opt.MapFrom(x => x.TechnologicalProcess.Number)
            )
            .ForMember(
                dto => dto.TechnologicalInstructionId,
                opt => opt.MapFrom(x => x.TechnologicalInstruction.Id)
            )
            .ForMember(
                dto => dto.TechnologicalInstructionName,
                opt => opt.MapFrom(x => x.TechnologicalInstruction.Name)
            )
            .ForMember(
                dto => dto.TechnologicalInstructionNumber,
                opt => opt.MapFrom(x => x.TechnologicalInstruction.Number)
            )
            .ForMember(dto => dto.SeamId, opt => opt.MapFrom(x => x.Seam.Id))
            .ForMember(dto => dto.SeamNumber, opt => opt.MapFrom(x => x.Seam.Number))
            .ForMember(dto => dto.SeamLength, opt => opt.MapFrom(x => x.Seam.Length))
            .ForMember(dto => dto.ProductNumber, opt => opt.MapFrom(x => x.Seam.Product.Number))
            .ForMember(dto => dto.KnotNumber, opt => opt.MapFrom(x => x.Seam.Knot!.Number))
            .ForMember(dto => dto.DetailNumber, opt => opt.MapFrom(x => x.Seam.Detail!.Number));
    }
}
