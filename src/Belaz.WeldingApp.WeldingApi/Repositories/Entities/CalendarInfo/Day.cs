using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo
{
    public class Day : Entity
    {
        [Required]
        public int MonthNumber { get; set; }

        [Required]
        public int Number { get; set; }

        /// <summary>
        /// Перерыв между сменами в минутах
        /// </summary>
        public int? BreakBetweenShifts { get; set; }

        [Required]
        public Guid CalendarId { get; set; }

        [ForeignKey(nameof(CalendarId))]
        public Calendar Calendar { get; set; }

        public List<WorkingShift> Shifts { get; set; }
    }
}
