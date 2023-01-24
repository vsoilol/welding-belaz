using Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.Day;
using Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.WorkingShift;

namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.Calendar;

public class UpdateCalendarRequest
{
    public Guid Id { get; set; }
    
    public int Year { get; set; }
}