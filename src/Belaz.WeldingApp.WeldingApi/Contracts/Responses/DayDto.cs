namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses;

public class DayDto
{
    public Guid Id { get; set; }
    
    public int MonthNumber { get; set; }
        
    public int Number { get; set; }

    public bool IsWorkingDay { get; set; }

    public IReadOnlyCollection<WorkingShiftDto>? WorkingShifts { get; set; }
}