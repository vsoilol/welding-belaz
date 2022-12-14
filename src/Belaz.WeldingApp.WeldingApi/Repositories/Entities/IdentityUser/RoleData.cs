using System.ComponentModel.DataAnnotations;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.IdentityUser
{
    public class RoleData : Entity
    {
        [Required]
        [MaxLength(20)]
        public string Name { get; set; }

        public List<UserRole> UserRoles { get; set; }
    }
}