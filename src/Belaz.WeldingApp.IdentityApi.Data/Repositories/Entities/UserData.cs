using System.ComponentModel.DataAnnotations;

namespace Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities
{
    public class UserData : Entity
    {
        [Required]
        [MaxLength(50)]
        public string FirstName { get; set; }

        [Required]
        [MaxLength(50)]
        public string LastName { get; set; }

        [Required]
        [MaxLength(50)]
        public string MiddleName { get; set; }

        [Required]
        [MaxLength(50)]
        public string UserName { get; set; }

        [Required]
        [MaxLength(100)]
        public string Email { get; set; }

        [Required]
        [MaxLength(300)]
        public string PasswordHash { get; set; }

        public List<UserRole> UserRoles { get; set; }
    }
}
