using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.CalendarInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.IdentityUser;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.Production;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.RegistarApi.Domain.Entities.Users;

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

    public List<Product> Products { get; set; } = null!;

    public List<WeldingTask> WeldingTasks { get; set; } = null!;
}