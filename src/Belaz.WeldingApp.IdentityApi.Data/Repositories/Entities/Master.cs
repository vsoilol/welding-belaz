using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;

namespace Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;

/// <summary>
/// Руководитель сварочных работ / Мастер
/// </summary>
public class Master : Entity
{
    public Guid UserId { get; set; }

    [ForeignKey(nameof(UserId))]
    public UserData UserInfo { get; set; } = null!;
}
