using System.ComponentModel.DataAnnotations;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Entities.IdentityUser
{
    public class RoleData : Entity
    {
        public string Name { get; set; }

        public List<UserRole> UserRoles { get; set; }
    }
}