using AutoMapper;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.CalendarInfo;

public class DayWithMainWorkingShiftDto : IMapFrom<Day>
{
    public int MonthNumber { get; set; }

    public int Number { get; set; }

    public int Year { get; set; }

    public bool IsWorkingDay { get; set; }

    public List<WorkingShiftDto>? WorkingShifts { get; set; }

    public List<WorkingShiftDto> MainWorkingShifts { get; set; } = null!;

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<Day, DayWithMainWorkingShiftDto>()
            .ForMember(
                dto => dto.MainWorkingShifts,
                opt =>
                    opt.MapFrom(x => x.Calendar.MainWorkingShifts)
            )
            .ForMember(
                dto => dto.Year,
                opt =>
                    opt.MapFrom(x => x.Calendar.Year)
            );
    }
}