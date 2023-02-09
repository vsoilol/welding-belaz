using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;

public class WeldingTaskFullNamesDto : IMapFrom<Entities.TaskInfo.WeldingTask>
{
    public int Number { get; set; }

    public UserFullNameDto? Welder { get; set; }

    public UserFullNameDto? Master { get; set; }

    public UserFullNameDto? Inspector { get; set; }

    public void Mapping(Profile profile)
    {
        profile.CreateMap<Entities.TaskInfo.WeldingTask, WeldingTaskFullNamesDto>()
            .ForMember(dto => dto.Inspector,
                opt => opt
                    .MapFrom(x => x.Seam.Inspector!.UserInfo))
            .ForMember(dto => dto.Welder,
                opt => opt
                    .MapFrom(x => x.Welder!.UserInfo))
            .ForMember(dto => dto.Master,
                opt => opt
                    .MapFrom(x => x.Seam.Product!.Master!.UserInfo));
    }
}