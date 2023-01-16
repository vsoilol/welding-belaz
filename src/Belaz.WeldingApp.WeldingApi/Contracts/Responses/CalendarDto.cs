namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses;

public class CalendarDto
{
    public Guid Id { get; set; }
    
    public int Year { get; set; }

    public IReadOnlyCollection<DayDto>? Days { get; set; }

    public IReadOnlyCollection<WorkingShiftDto> MainWorkingShifts { get; set; } = null!;
}