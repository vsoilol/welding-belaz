namespace Belaz.WeldingApp.RegistarApi.Domain.Entities.IdentityUser
{
    public class RoleData : Entity
    {
        public string Name { get; set; } = null!;

        public List<UserRole> UserRoles { get; set; } = null!;
    }
}
