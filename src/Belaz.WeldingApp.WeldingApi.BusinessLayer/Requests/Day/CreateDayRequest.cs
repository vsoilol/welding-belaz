using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;

public class CreateDayRequest
{
    public int MonthNumber { get; set; }
        
    public int Number { get; set; }

    public bool IsWorkingDay { get; set; }
    
    public List<CreateWorkingShiftRequest>? WorkingShifts { get; set; }
}