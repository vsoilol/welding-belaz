using System.ComponentModel.DataAnnotations;

namespace Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities
{
    public class RoleData : Entity
    {
        public string Name { get; set; }

        public List<UserRole> UserRoles { get; set; }
    }
}
