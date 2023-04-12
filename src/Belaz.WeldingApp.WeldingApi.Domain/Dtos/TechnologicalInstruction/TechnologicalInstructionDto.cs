using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;

public class TechnologicalInstructionDto
    : IMapFrom<Entities.TechnologicalProcessInfo.TechnologicalInstruction>
{
    public Guid Id { get; set; }

    public int Number { get; set; }

    public string Name { get; set; } = null!;

    public List<SeamDto> Seams { get; set; } = null!;

    public List<WeldPassageInstructionDto> WeldPassageInstructions { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<
                Entities.TechnologicalProcessInfo.TechnologicalInstruction,
                TechnologicalInstructionDto
            >()
            .ForMember(
                dto => dto.WeldPassageInstructions,
                opt => opt.MapFrom(x => x.WeldPassageInstructions.OrderBy(_ => _.Number))
            );
    }
}
