using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workplace;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;

public class SeamDto : IMapFrom<Entities.ProductInfo.Seam>
{
    public Guid Id { get; set; }

    public int Number { get; set; }

    public ProductBriefDto Product { get; set; } = null!;

    public WorkplaceBriefDto? Workplace { get; set; }

    public ProductionAreaBriefDto ProductionArea { get; set; } = null!;

    public WorkshopBriefDto Workshop { get; set; } = null!;

    public TechnologicalProcessBriefDto TechnologicalProcess { get; set; } = null!;

    public TechnologicalInstructionBriefDto TechnologicalInstruction { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile.CreateMap<Entities.ProductInfo.Seam, SeamDto>()
            .ForMember(dto => dto.Product,
                opt => opt
                    .MapFrom(x => x.Product))
            .ForMember(dto => dto.TechnologicalInstruction,
                opt => opt
                    .MapFrom(x => x.TechnologicalInstruction))
            .ForMember(dto => dto.TechnologicalProcess,
                opt => opt
                    .MapFrom(x => x.TechnologicalInstruction!.TechnologicalProcess))
            .ForMember(dto => dto.ProductionArea,
                opt => opt
                    .MapFrom(x => x.ProductionArea))
            .ForMember(dto => dto.Workshop,
                opt => opt
                    .MapFrom(x => x.ProductionArea!.Workshop))
            .ForMember(dto => dto.Workplace,
                opt => opt
                    .MapFrom(x => x.Workplace));
    }
}