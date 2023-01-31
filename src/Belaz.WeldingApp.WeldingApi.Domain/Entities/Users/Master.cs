using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.Users
{
    /// <summary>
    /// Руководитель сварочных работ / Мастер
    /// </summary>
    public class Master : Entity
    {
        public Guid UserId { get; set; }

        [ForeignKey(nameof(UserId))] 
        public UserData UserInfo { get; set; } = null!;

        public Guid? WeldingEquipmentId { get; set; }

        [ForeignKey(nameof(WeldingEquipmentId))]
        public WeldingEquipment? WeldingEquipment { get; set; }

        public List<Product> Products { get; set; } = null!;
    }
}