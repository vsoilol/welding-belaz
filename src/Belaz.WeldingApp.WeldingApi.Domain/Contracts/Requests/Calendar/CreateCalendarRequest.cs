using Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.Day;
using Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.WorkingShift;

namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.Calendar;

public class CreateCalendarRequest
{
    public int Year { get; set; }

    public List<CreateWorkingShiftRequest> MainWorkingShift { get; set; } = null!;
    
    public List<CreateDayRequest>? Days { get; set; }
}