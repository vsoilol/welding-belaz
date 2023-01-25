using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;

public class CreateDayWithCalendarIdRequest
{
    public int MonthNumber { get; set; }
        
    public int Number { get; set; }

    public bool IsWorkingDay { get; set; }

    public Guid CalendarId { get; set; }
    
    public List<CreateWorkingShiftRequest>? WorkingShifts { get; set; }
}