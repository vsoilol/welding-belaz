using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.IdentityUser;

public class UserRole
{
    public Guid UserId { get; set; }

    [ForeignKey(nameof(UserId))] public UserData User { get; set; } = null!;

    public Guid RoleId { get; set; }

    [ForeignKey(nameof(RoleId))] public RoleData Role { get; set; } = null!;
}