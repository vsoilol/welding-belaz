using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.IdentityUser
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