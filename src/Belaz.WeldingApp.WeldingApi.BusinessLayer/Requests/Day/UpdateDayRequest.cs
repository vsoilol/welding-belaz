using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;

public class UpdateDayRequest
{
    public Guid Id { get; set; }
    
    public int MonthNumber { get; set; }
        
    public int Number { get; set; }

    public bool IsWorkingDay { get; set; }
}