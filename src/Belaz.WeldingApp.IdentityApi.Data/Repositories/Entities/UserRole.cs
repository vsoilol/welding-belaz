using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities
{
    public class UserRole
    {
        [Required]
        public Guid UserId { get; set; }

        [ForeignKey(nameof(UserId))]
        public UserData User { get; set; }

        [Required]
        public Guid RoleId { get; set; }

        [ForeignKey(nameof(RoleId))]
        public RoleData Role { get; set; }
    }
}
