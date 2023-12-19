using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Converters;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;

public class SeamDto : IMapFrom<Belaz.WeldingApp.Common.Entities.ProductInfo.Seam>
{
    public Guid Id { get; set; }

    public string? IdFromSystem { get; set; }

    public string Number { get; set; } = null!;

    public int Length { get; set; }

    /// <summary>
    /// Поддлежит ли исполнению на регистраторе
    /// </summary>
    public bool IsPerformed { get; set; }

    public ProductOverviewDto Product { get; set; } = null!;

    public ProductOverviewDto? Knot { get; set; }

    public ProductOverviewDto? Detail { get; set; }

    public ProductionAreaBriefDto ProductionArea { get; set; } = null!;

    public WorkshopBriefDto Workshop { get; set; } = null!;

    public TechnologicalProcessBriefDto TechnologicalProcess { get; set; } = null!;

    public TechnologicalInstructionBriefDto TechnologicalInstruction { get; set; } = null!;

    public bool IsControlSubject { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<Belaz.WeldingApp.Common.Entities.ProductInfo.Seam, SeamDto>()
            .ConvertUsing<SeamDtoConverter>();
    }
}
