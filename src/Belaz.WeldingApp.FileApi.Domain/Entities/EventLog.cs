using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.FileApi.Domain.Entities.IdentityUser;

namespace Belaz.WeldingApp.FileApi.Domain.Entities;

public class EventLog : Entity
{
    [Required]
    [MaxLength(200)]
    public string Information { get; set; } = null!;

    [Required]
    public DateTime DateTime { get; set; }

    public Guid? UserId { get; set; }

    [ForeignKey(nameof(UserId))]
    public UserData? User { get; set; }
}
