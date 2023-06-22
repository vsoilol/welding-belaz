using AutoMapper;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.CalendarInfo;

public class WorkingShiftDto : IMapFrom<WorkingShift>
{
    public int Number { get; set; }

    public TimeSpan ShiftStart { get; set; }

    public TimeSpan ShiftEnd { get; set; }

    public TimeSpan? BreakStart { get; set; }

    public TimeSpan? BreakEnd { get; set; }

    public int Year { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<WorkingShift, WorkingShiftDto>()
            .ForMember(
                dto => dto.Year,
                opt =>
                    opt.MapFrom(x => x.Calendar == null ? x.Day!.Calendar.Year : x.Calendar.Year)
            );
    }
}