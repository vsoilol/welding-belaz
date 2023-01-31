using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldPassage;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalInstruction;

public class CreateInstructionRequest : IMapTo<Domain.Entities.TaskInfo.TechnologicalInstruction>
{
    public int Number { get; set; }

    public string Name { get; set; } = null!;
    
    public Guid SeamId { get; set; }
    
    public Guid TechnologicalProcessId { get; set; }

    public List<CreateWeldPassageRequest> WeldPassages { get; set; } = null!;
    
    public void Mapping(Profile profile)
    {
        profile.CreateMap<CreateInstructionRequest, Domain.Entities.TaskInfo.TechnologicalInstruction>()
            .ForMember(dto => dto.WeldPassages,
                opt => opt.Ignore());
    }
}