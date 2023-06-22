using AutoMapper;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.CalendarInfo;

public class DayDto : IMapFrom<Day>
{
    public int MonthNumber { get; set; }

    public int Number { get; set; }

    public bool IsWorkingDay { get; set; }
    
    public int Year { get; set; }

    public List<WorkingShiftDto>? WorkingShifts { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<Day, DayDto>()
            .ForMember(
                dto => dto.Year,
                opt =>
                    opt.MapFrom(x => x.Calendar.Year)
            );
    }
}
