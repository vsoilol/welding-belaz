using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Entities.Users
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