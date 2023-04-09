using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.IdentityUser;

[Index(nameof(RfidTag), IsUnique = true)]
public class UserData : EntityWithRfidTag
{
    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string MiddleName { get; set; } = null!;

    public string? UserName { get; set; }

    public string? Email { get; set; }

    public string? PasswordHash { get; set; }

    public string? Position { get; set; }

    /// <summary>
    /// Табельный номер
    /// </summary>
    public string? ServiceNumber { get; set; }

    /// <summary>
    /// Срок действия удостоверения
    /// </summary>
    public DateTime? CertificateValidityPeriod { get; set; }

    public Guid? ProductionAreaId { get; set; }

    [ForeignKey(nameof(ProductionAreaId))]
    public ProductionArea? ProductionArea { get; set; }

    public List<UserRole> UserRoles { get; set; } = null!;

    public List<Welder> Welders { get; set; } = null!;

    public List<Master> Masters { get; set; } = null!;

    public List<Inspector> Inspectors { get; set; } = null!;

    public List<Chief> Chiefs { get; set; } = null!;
}
