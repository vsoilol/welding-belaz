using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.RegistarApi.Domain.Entities.CalendarInfo;

/// <summary>
/// Смена
/// </summary>
public class WorkingShift : Entity
{
    public int Number { get; set; }

    public TimeSpan ShiftStart { get; set; }

    public TimeSpan ShiftEnd { get; set; }

    public TimeSpan? BreakStart { get; set; }

    public TimeSpan? BreakEnd { get; set; }

    public Guid? DayId { get; set; }

    [ForeignKey(nameof(DayId))]
    public Day? Day { get; set; }

    public Guid? CalendarId { get; set; }

    [ForeignKey(nameof(CalendarId))]
    public Calendar? Calendar { get; set; }
}
