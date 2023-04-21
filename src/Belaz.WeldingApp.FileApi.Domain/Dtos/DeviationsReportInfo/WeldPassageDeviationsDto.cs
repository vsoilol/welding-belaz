using AutoMapper;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.DeviationsReportInfo;

public class WeldPassageDeviationsDto : IMapFrom<WeldPassage>
{
    /// <summary>
    /// Отклонение кратковременные, до 1 секунды, в секундах
    /// </summary>
    public double? ShortTermDeviation { get; set; }

    /// <summary>
    /// Отклонения длительные, более 1 секунды, в секундах
    /// </summary>
    public double? LongTermDeviation { get; set; }

    /// <summary>
    /// Время сварки, в секундах
    /// </summary>
    public int WeldingTime { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<WeldPassage, WeldPassageDeviationsDto>()
            .ForMember(
                dto => dto.WeldingTime,
                opt =>
                    opt.MapFrom(
                        x =>
                            x.WeldingRecord.WeldingEndTime
                                .Subtract(x.WeldingRecord.WeldingStartTime)
                                .Seconds
                    )
            );
    }
}
