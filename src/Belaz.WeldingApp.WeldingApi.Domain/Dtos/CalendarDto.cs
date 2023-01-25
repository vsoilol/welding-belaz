using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.CalendarInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos;

public class CalendarDto : IMapFrom<Calendar>
{
    public Guid Id { get; set; }
    
    public int Year { get; set; }

    public IReadOnlyCollection<DayDto>? Days { get; set; }

    public IReadOnlyCollection<WorkingShiftDto> MainWorkingShifts { get; set; } = null!;
}