using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.Common.Entities.IdentityUser;

namespace Belaz.WeldingApp.Common.Entities;

public class EventLog : Entity
{
    [Required]
    public string Information { get; set; } = null!;

    [Required]
    public DateTime DateTime { get; set; }

    public Guid UserId { get; set; }

    [ForeignKey(nameof(UserId))]
    public UserData User { get; set; } = null!;
}
