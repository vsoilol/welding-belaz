using Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.Day;
using Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.WorkingShift;

namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.Calendar;

public class CreateCalendarWithWelderIdRequest
{
    public int Year { get; set; }

    public Guid WelderId { get; set; }

    public List<CreateWorkingShiftRequest> MainWorkingShift { get; set; } = null!;
    
    public List<CreateDayRequest>? Days { get; set; }
}