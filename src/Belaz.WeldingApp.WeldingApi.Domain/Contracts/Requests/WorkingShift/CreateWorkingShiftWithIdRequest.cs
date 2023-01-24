namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.WorkingShift;

public class CreateWorkingShiftWithIdRequest
{
    public int Number { get; set; }

    public string ShiftStart { get; set; } = null!;

    public string ShiftEnd { get; set; } = null!;

    public string? BreakStart { get; set; }

    public string? BreakEnd { get; set; }

    public Guid? CalendarId { get; set; }
    
    public Guid? DayId { get; set; }
}