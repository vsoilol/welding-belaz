using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.Common.Entities.CalendarInfo;

public class Day : Entity
{
    public int MonthNumber { get; set; }

    public int Number { get; set; }

    public bool IsWorkingDay { get; set; }

    public Guid CalendarId { get; set; }

    [ForeignKey(nameof(CalendarId))]
    public Calendar Calendar { get; set; } = null!;

    public List<WorkingShift>? WorkingShifts { get; set; }
}
