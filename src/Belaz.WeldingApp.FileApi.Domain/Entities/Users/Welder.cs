using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.FileApi.Domain.Entities;
using Belaz.WeldingApp.FileApi.Domain.Entities.CalendarInfo;
using Belaz.WeldingApp.FileApi.Domain.Entities.IdentityUser;
using Belaz.WeldingApp.FileApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Entities.Production;
using Belaz.WeldingApp.FileApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.FileApi.Domain.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.FileApi.Domain.Entities.Users
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