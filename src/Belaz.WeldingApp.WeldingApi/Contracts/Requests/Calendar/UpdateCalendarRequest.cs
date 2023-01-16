using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Day;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.WorkingShift;

namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.Calendar;

public class UpdateCalendarRequest
{
    public Guid Id { get; set; }
    
    public int Year { get; set; }
}