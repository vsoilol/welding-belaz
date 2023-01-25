using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;

public class CreateCalendarWithWelderIdRequest
{
    public int Year { get; set; }

    public Guid WelderId { get; set; }

    public List<CreateWorkingShiftRequest> MainWorkingShift { get; set; } = null!;
    
    public List<CreateDayRequest>? Days { get; set; }
}