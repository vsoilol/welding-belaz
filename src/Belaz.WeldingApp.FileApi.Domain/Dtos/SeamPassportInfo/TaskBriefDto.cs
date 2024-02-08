using AutoMapper;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

public class TaskBriefDto : IMapFrom<WeldingTask>
{
    public SeamBriefDto Seam { get; set; } = null!;

    public List<WeldPassageDto> WeldPassages { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<WeldingTask, TaskBriefDto>()
            .ForMember(dto => dto.Seam,
                opt =>
                    opt.MapFrom(x => x.SeamAccount.Seam))
            .ForMember(
                dto => dto.WeldPassages,
                opt =>
                    opt.MapFrom(x =>
                        x.WeldPassages
                            .OrderBy(_ => _.WeldingRecord.Date.Date)
                            .ThenBy(_ => _.WeldingRecord.WeldingStartTime.TotalSeconds)));
    }
}