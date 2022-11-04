using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Managers.Models
{
    public class User
    {
        public int Id { get; set; }

        public string FirstName { get; set; }

        public string MiddleName { get; set; }

        public string LastName { get; set; }

        public string Email { get; set; }

        public string UserName { get; set; }

        public DateTime CreatedAt { get; set; }

        public DateTime UpdatedAt { get; set; }

        public byte[] PasswordHash { get; set; }

        public byte[] PasswordSalt { get; set; }

        public List<UserRoleData> UserRoles { get; set; }
    }
}
