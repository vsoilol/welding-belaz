using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users
{
    /// <summary>
    /// Сварщик
    /// </summary>
    public class Welder : Entity
    {
        public Guid UserId { get; set; }
        
        [ForeignKey(nameof(UserId))]
        public UserData UserInfo { get; set; } = null!;
        
        public Guid? WorkplaceId { get; set; }
        
        [ForeignKey(nameof(WorkplaceId))]
        public Workplace? Workplace { get; set; }
        
        public Guid? CalendarId { get; set; }
        
        [ForeignKey(nameof(CalendarId))]
        public Calendar? Calendar { get; set; }
        
        public Guid? WeldingEquipmentId { get; set; }
        
        [ForeignKey(nameof(WeldingEquipmentId))]
        public WeldingEquipment? WeldingEquipment { get; set; }

        public List<WeldingTask> WeldingTasks { get; set; } = null!;
    }
}