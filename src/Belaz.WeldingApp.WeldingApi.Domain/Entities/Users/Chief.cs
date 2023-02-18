using Belaz.WeldingApp.WeldingApi.Domain.Entities.IdentityUser;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;

/// <summary>
/// Начальник цеха
/// </summary>
public class Chief : Entity
{
    public Guid UserId { get; set; }

    [ForeignKey(nameof(UserId))] public UserData UserInfo { get; set; } = null!;

    public List<WeldingEquipment> WeldingEquipments { get; set; } = null!;
}