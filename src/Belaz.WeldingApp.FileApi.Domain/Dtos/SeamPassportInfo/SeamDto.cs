using AutoMapper;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

public class SeamDto : IMapFrom<Seam>
{
    public int Number { get; set; }

    public string? DefectiveReason { get; set; }

    public string? DetectedDefects { get; set; }

    public ProductBriefDto? Product { get; set; }

    public ProductBriefDto? Detail { get; set; }

    public ProductBriefDto? Knot { get; set; }

    public ProductionAreaBriefDto ProductionArea { get; set; } = null!;

    public WorkshopBriefDto Workshop { get; set; } = null!;

    public TechnologicalInstructionBriefDto TechnologicalInstruction { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<Seam, SeamDto>()
            .ForMember(dto => dto.Product, opt => opt.Ignore())
            .ForMember(dto => dto.Detail, opt => opt.Ignore())
            .ForMember(dto => dto.Knot, opt => opt.Ignore())
            .ForMember(dto => dto.DefectiveReason, opt => opt.Ignore())
            .ForMember(dto => dto.Workshop, opt => opt.MapFrom(x => x.ProductionArea!.Workshop));
    }
}
