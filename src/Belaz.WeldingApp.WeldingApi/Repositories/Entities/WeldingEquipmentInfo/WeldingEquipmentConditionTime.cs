using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo
{
    public class WeldingEquipmentConditionTime : Entity
    {
        public Condition Condition { get; set; }

        /// <summary>
        /// Причина простоя
        /// </summary>
        public string? DowntimeReason { get; set; }
        
        public DateTime Date { get; set; }
        
        public TimeSpan StartConditionTime { get; set; }

        /// <summary>
        /// Сколько оборудование находиться в данном состоянии в минутах
        /// </summary>
        public int Time { get; set; } = 0;
        
        public Guid WeldingEquipmentId { get; set; }

        [ForeignKey(nameof(WeldingEquipmentId))]
        public WeldingEquipment WeldingEquipment { get; set; } = null!;
    }
}