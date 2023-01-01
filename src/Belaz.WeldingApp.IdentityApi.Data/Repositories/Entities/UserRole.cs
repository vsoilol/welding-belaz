using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities
{
    public class UserRole
    {
        public Guid UserId { get; set; }

        [ForeignKey(nameof(UserId))]
        public UserData User { get; set; }

        public Guid RoleId { get; set; }

        [ForeignKey(nameof(RoleId))]
        public RoleData Role { get; set; }
    }
}
