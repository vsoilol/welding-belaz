using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;

public class CreateDayWithYearRequest : IMapTo<Domain.Entities.CalendarInfo.Day>
{
    public int MonthNumber { get; set; }

    public int Number { get; set; }

    public bool IsWorkingDay { get; set; }

    public int Year { get; set; }

    public Guid? WeldingEquipmentId { get; set; }

    public Guid? WelderId { get; set; }

    public List<CreateWorkingShiftRequest>? WorkingShifts { get; set; }
}