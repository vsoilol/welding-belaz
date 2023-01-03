using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class TechnologicalInstructionProfile : Profile
{
    public TechnologicalInstructionProfile()
    {
        CreateMap<TechnologicalInstruction, TechnologicalInstructionDto>()
            .ForMember(dto => dto.Seam,
                opt => opt
                    .MapFrom(x => x.Seam))
            .ForMember(dto => dto.WeldPassages,
                opt => opt
                    .MapFrom(x => x.WeldPassages));
        
        CreateMap<TechnologicalInstruction, TechnologicalInstructionBriefDto>();
        
        CreateMap<CreateInstructionRequest, TechnologicalInstruction>()
            .ForMember(dto => dto.WeldPassages,
                opt => opt
                    .MapFrom(x => x.WeldPassages))
            .AfterMap((src, dest) => { 
                foreach(var i in dest.WeldPassages) 
                    i.SeamId = src.SeamId;
            });
    }
}