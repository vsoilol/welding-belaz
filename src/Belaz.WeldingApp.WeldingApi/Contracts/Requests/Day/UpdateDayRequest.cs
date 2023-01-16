using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.WorkingShift;

namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.Day;

public class UpdateDayRequest
{
    public Guid Id { get; set; }
    
    public int MonthNumber { get; set; }
        
    public int Number { get; set; }

    public bool IsWorkingDay { get; set; }
}