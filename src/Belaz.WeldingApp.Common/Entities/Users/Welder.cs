using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;
using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.Common.Entities.Users;

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

    public List<WeldingTask> WeldingTasks { get; set; } = null!;

    public List<WeldingRecord> WeldingRecords { get; set; } = null!;
}
