using Belaz.WeldingApp.FileApi.Domain.Entities.IdentityUser;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.FileApi.Domain.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.FileApi.Domain.Entities.Users
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
