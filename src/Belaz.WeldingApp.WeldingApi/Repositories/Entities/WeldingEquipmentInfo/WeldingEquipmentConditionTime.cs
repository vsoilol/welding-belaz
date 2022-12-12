using System.ComponentModel.DataAnnotations;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Enums;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo
{
    public class WeldingEquipmentConditionTime : Entity
    {
        [Required]
        public Condition Condition { get; set; }

        /// <summary>
        /// Причина простоя
        /// </summary>
        public string? DowntimeReason { get; set; }

        /// <summary>
        /// Время изменения состояния
        /// </summary>
        public TimeSpan? ChangeConditionTime { get; set; }

        /// <summary>
        /// Сколько оборудование находиться в данном состоянии в минутах
        /// </summary>
        [Required]
        public int Time { get; set; } = 0;

        public WeldingEquipmentWorkingShift? WeldingEquipmentWorkingShift { get; set; }
    }
}
