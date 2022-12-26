using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.WeldingTask;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.Mapping;

public class WeldingTaskProfile : Profile
{
    public WeldingTaskProfile()
    {
        CreateMap<WeldingTask, WeldingTaskRegistrarInfoDto>();

        CreateMap<WeldingTask, WeldingTaskFullNamesDto>()
            .ForMember(dto => dto.Inspector,
                opt => opt
                    .MapFrom(x => x.Inspector.UserInfo))
            .ForMember(dto => dto.Welder,
                opt => opt
                    .MapFrom(x => x.Welder.UserInfo))
            .ForMember(dto => dto.Master,
                opt => opt
                    .MapFrom(x => x.Master.UserInfo));
    }
}