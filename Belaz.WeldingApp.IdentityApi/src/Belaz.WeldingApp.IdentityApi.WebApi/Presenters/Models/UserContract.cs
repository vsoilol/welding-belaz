using System.ComponentModel.DataAnnotations;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Models
{
    public class UserContract
    {
        public int Id { get; set; }

        [Required]
        public string FirstName { get; set; }

        [Required]
        public string MiddleName { get; set; }

        [Required]
        public string LastName { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        public string UserName { get; set; }

        [Required]
        public string Role { get; set; }

        public DateTime CreatedAt { get; set; }

        public DateTime UpdatedAt { get; set; }
    }
}
