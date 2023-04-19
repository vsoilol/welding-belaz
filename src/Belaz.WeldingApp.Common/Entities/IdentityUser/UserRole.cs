using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.Common.Entities.IdentityUser;

public class UserRole
{
    public Guid UserId { get; set; }

    [ForeignKey(nameof(UserId))]
    public UserData User { get; set; } = null!;

    public Guid RoleId { get; set; }

    [ForeignKey(nameof(RoleId))]
    public RoleData Role { get; set; } = null!;
}
