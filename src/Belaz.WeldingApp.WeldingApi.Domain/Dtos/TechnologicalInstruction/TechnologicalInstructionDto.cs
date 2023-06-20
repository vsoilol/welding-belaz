﻿using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;

public class TechnologicalInstructionDto
    : IMapFrom<Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo.TechnologicalInstruction>
{
    public Guid Id { get; set; }

    public string Number { get; set; } = null!;

    public string Name { get; set; } = null!;

    public List<SeamDto> Seams { get; set; } = null!;

    public List<WeldPassageInstructionDto> WeldPassageInstructions { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<
                Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo.TechnologicalInstruction,
                TechnologicalInstructionDto
            >()
            .ForMember(
                dto => dto.WeldPassageInstructions,
                opt => opt.MapFrom(x => x.WeldPassageInstructions.OrderBy(_ => _.Number))
            );
    }
}
