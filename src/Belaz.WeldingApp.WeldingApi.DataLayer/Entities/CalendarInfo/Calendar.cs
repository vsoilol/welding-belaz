using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.Users;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Entities.CalendarInfo
{
    public class Calendar : Entity
    {
        public int Year { get; set; }
        
        public bool IsMain { get; set; }
        
        public List<WorkingShift> MainWorkingShifts { get; set; } = null!;

        public List<Day>? Days { get; set; }
        
        public Guid? WelderId { get; set; }
        
        [ForeignKey(nameof(WelderId))]
        public Welder? Welder { get; set; }
        
        public Guid? WeldingEquipmentId { get; set; }
        
        [ForeignKey(nameof(WeldingEquipmentId))]
        public WeldingEquipment? WeldingEquipment { get; set; }
    }
}