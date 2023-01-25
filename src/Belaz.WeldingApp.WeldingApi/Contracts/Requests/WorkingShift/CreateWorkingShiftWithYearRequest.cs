namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.WorkingShift;

public class CreateWorkingShiftWithYearRequest
{
    public int Number { get; set; }

    public string ShiftStart { get; set; } = null!;

    public string ShiftEnd { get; set; } = null!;

    public string? BreakStart { get; set; }

    public string? BreakEnd { get; set; }

    public int? Year { get; set; }
    
    public Guid? DayId { get; set; }
}