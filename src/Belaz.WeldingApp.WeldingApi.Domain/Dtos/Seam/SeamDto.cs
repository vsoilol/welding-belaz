using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;

public class SeamDto : IMapFrom<Entities.ProductInfo.Seam>
{
    public Guid Id { get; set; }

    public string? IdFromSystem { get; set; }

    public int Number { get; set; }

    public int Length { get; set; }

    /// <summary>
    /// Поддлежит ли исполнению на регистраторе
    /// </summary>
    public bool IsPerformed { get; set; }

    public MainProductDto Product { get; set; } = null!;

    public ProductionAreaBriefDto ProductionArea { get; set; } = null!;

    public WorkshopBriefDto Workshop { get; set; } = null!;

    public TechnologicalProcessBriefDto TechnologicalProcess { get; set; } = null!;

    public TechnologicalInstructionBriefDto TechnologicalInstruction { get; set; } = null!;

    public bool IsControlSubject { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<Entities.ProductInfo.Seam, SeamDto>()
            .ForMember(
                dto => dto.TechnologicalProcess,
                opt => opt.MapFrom(x => x.Product!.TechnologicalProcess)
            )
            .ForMember(dto => dto.Workshop, opt => opt.MapFrom(x => x.ProductionArea!.Workshop));
    }
}
