using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.CalendarInfo;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.Production;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Entities.Users
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

        public List<Calendar> Calendars { get; set; } = null!;

        public List<WeldingEquipment> WeldingEquipments { get; set; } = null!;

        public List<Seam> Seams { get; set; } = null!;
    }
}