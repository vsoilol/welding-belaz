using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldPassage;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalInstruction;

public class UpdateInstructionRequest : IMapTo<Domain.Entities.TaskInfo.TechnologicalInstruction>
{
    public Guid Id { get; set; }

    public int Number { get; set; }

    public string Name { get; set; } = null!;

    public List<UpdateWeldPassageRequest> WeldPassages { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile.CreateMap<UpdateInstructionRequest, Domain.Entities.TaskInfo.TechnologicalInstruction>()
            .ForMember(dto => dto.WeldPassages,
                opt => opt.Ignore());
    }
}