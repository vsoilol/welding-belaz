using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.IdentityUser;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Entities.Users
{
    /// <summary>
    /// Начальник цеха
    /// </summary>
    public class Chief : Entity
    {
        public Guid UserId { get; set; }

        [ForeignKey(nameof(UserId))] 
        public UserData UserInfo { get; set; } = null!;
        
        public Guid? WeldingEquipmentId { get; set; }
        
        [ForeignKey(nameof(WeldingEquipmentId))]
        public WeldingEquipment? WeldingEquipment { get; set; }
    }
}
