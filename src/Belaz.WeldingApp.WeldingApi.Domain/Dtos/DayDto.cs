using AutoMapper;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos;

public class DayDto : IMapFrom<Day>
{
    public Guid Id { get; set; }

    public int MonthNumber { get; set; }

    public int Number { get; set; }

    public bool IsWorkingDay { get; set; }

    public int Year { get; set; }

    public IReadOnlyCollection<WorkingShiftDto>? WorkingShifts { get; set; }

    public void Mapping(Profile profile)
    {
        profile
            .CreateMap<Day, DayDto>()
            .ForMember(dto => dto.Year, opt => opt.MapFrom(x => x.Calendar.Year));
    }
}
