using System.ComponentModel.DataAnnotations;
using Belaz.WeldingApp.IdentityApi.Attributes;

namespace Belaz.WeldingApp.IdentityApi.Presenters.Models
{
    public class RegisterModelContract
    {
        [Required]
        public string FirstName { get; set; }

        [Required]
        public string MiddleName { get; set; }

        [Required]
        public string LastName { get; set; }

        [Required]
        [CustomEmailAddress]
        public string Email { get; set; }

        public string UserName { get; set; }

        [Required]
        public string Role { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} and at max {1} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }
}
