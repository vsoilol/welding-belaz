using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo
{
    /// <summary>
    /// Смена
    /// </summary>
    public class WorkingShift : Entity
    {
        [Required]
        public int Number { get; set; }

        [Required]
        public TimeSpan ShiftStart { get; set; }

        [Required]
        public TimeSpan ShiftEnd { get; set; }

        [Required]
        public Guid DayId { get; set; }

        [ForeignKey(nameof(DayId))]
        public Day Day { get; set; }

        public List<WeldingEquipmentWorkingShift> WeldingEquipmentWorkingShifts { get; set; }
    }
}
