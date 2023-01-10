using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class TechnologicalProcessProfile : Profile
{
    public TechnologicalProcessProfile()
    {
        CreateMap<TechnologicalProcess, TechnologicalProcessDto>()
            .ForMember(dto => dto.TechnologicalInstructions,
                opt => opt
                    .MapFrom(x => x.TechnologicalInstructions));
        
        CreateMap<TechnologicalProcess, TechnologicalProcessBriefDto>();
        
        CreateMap<CreateTechnologicalProcessRequest, TechnologicalProcess>();
    }
}