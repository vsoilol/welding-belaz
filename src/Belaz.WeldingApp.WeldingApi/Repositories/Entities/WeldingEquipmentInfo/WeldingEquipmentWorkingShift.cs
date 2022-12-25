using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo
{
    /// <summary>
    /// Состояние сварочного оборудования
    /// </summary>
    public class WeldingEquipmentWorkingShift
    {
        public Guid WeldingEquipmentId { get; set; }
        
        [ForeignKey(nameof(WeldingEquipmentId))]
        public WeldingEquipment WeldingEquipment { get; set; }
        
        public Guid WorkingShiftId { get; set; }
        
        [ForeignKey(nameof(WorkingShiftId))]
        public WorkingShift WorkingShift { get; set; }
        
        public Guid WeldingEquipmentConditionTimeId { get; set; }
        
        [ForeignKey(nameof(WeldingEquipmentConditionTimeId))]
        public WeldingEquipmentConditionTime WeldingEquipmentConditionTime { get; set; }
    }
}