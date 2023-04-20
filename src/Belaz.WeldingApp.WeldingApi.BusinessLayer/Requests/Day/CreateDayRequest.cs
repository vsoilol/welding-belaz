using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;

public class CreateDayRequest : IMapTo<Belaz.WeldingApp.Common.Entities.CalendarInfo.Day>
{
    public int MonthNumber { get; set; }

    public int Number { get; set; }

    public bool IsWorkingDay { get; set; }

    public List<CreateWorkingShiftRequest>? WorkingShifts { get; set; }
}
