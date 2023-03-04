using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;

/// <summary>
/// Контролер УКК
/// </summary>
public class Inspector : Entity
{
    public Guid UserId { get; set; }

    [ForeignKey(nameof(UserId))]
    public UserData UserInfo { get; set; } = null!;
}
