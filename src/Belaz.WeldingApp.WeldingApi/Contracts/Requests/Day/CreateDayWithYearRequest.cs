using Belaz.WeldingApp.WeldingApi.Contracts.Requests.WorkingShift;

namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.Day;

public class CreateDayWithYearRequest
{
    public int MonthNumber { get; set; }
        
    public int Number { get; set; }

    public bool IsWorkingDay { get; set; }

    public int Year { get; set; }
    
    public Guid? WeldingEquipmentId { get; set; }
    
    public Guid? WelderId { get; set; }
    
    public List<CreateWorkingShiftRequest>? WorkingShifts { get; set; }
}