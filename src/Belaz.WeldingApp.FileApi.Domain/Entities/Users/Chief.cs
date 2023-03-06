using Belaz.WeldingApp.FileApi.Domain.Entities.IdentityUser;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.FileApi.Domain.Entities.Production;
using Belaz.WeldingApp.FileApi.Domain.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.FileApi.Domain.Entities.Users;

/// <summary>
/// Начальник цеха
/// </summary>
public class Chief : Entity
{
    public Guid UserId { get; set; }

    [ForeignKey(nameof(UserId))]
    public UserData UserInfo { get; set; } = null!;

    public Guid WorkshopId { get; set; }

    [ForeignKey(nameof(WorkshopId))]
    public Workshop Workshop { get; set; } = null!;
}
