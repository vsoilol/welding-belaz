using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;

public class UpdateCalendarRequest
{
    public Guid Id { get; set; }
    
    public int Year { get; set; }
}