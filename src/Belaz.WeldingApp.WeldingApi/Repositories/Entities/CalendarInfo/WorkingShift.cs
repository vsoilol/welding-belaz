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
        public int Number { get; set; }
        
        public TimeSpan ShiftStart { get; set; }
        
        public TimeSpan ShiftEnd { get; set; }
        
        public Guid DayId { get; set; }
        
        [ForeignKey(nameof(DayId))]
        public Day Day { get; set; }
        
        public List<WeldingEquipmentWorkingShift> WeldingEquipmentWorkingShifts { get; set; }
    }
}