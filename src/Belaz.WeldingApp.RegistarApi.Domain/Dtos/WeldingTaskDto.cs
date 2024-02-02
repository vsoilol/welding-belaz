using AutoMapper;
using Belaz.WeldingApp.RegistarApi.Domain.Converters;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Mappings;

namespace Belaz.WeldingApp.RegistarApi.Domain.Dtos;

public class WeldingTaskDto : IMapFrom<WeldingTask>
{
    public Guid Id { get; set; }

    public int Number { get; set; }

    public SeamDto Seam { get; set; } = null!;
    
    public string? SequenceNumber { get; set; }

    public TechnologicalProcessDto TechnologicalProcess { get; set; } = null!;

    public TechnologicalInstructionDto TechnologicalInstruction { get; set; } = null!;

    public List<WeldPassageInstructionDto> WeldPassageInstructions { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile.CreateMap<WeldingTask, WeldingTaskDto>().ConvertUsing<WeldingTaskToDtoConverter>();
    }
}
