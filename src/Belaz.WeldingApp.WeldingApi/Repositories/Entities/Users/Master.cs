using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users
{
    /// <summary>
    /// Руководитель сварочных работ / Мастер
    /// </summary>
    public class Master : Entity
    {
        public Guid UserId { get; set; }
        
        [ForeignKey(nameof(UserId))]
        public UserData UserInfo { get; set; }

        public WeldingEquipment? WeldingEquipment { get; set; }
        
        public List<WeldingTask> WeldingTasks { get; set; }
    }
}