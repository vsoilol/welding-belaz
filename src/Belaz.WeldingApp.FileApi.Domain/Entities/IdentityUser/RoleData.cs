using System.ComponentModel.DataAnnotations;

namespace Belaz.WeldingApp.FileApi.Domain.Entities.IdentityUser
{
    public class RoleData : Entity
    {
        public string Name { get; set; } = null!;

        public List<UserRole> UserRoles { get; set; } = null!;
    }
}