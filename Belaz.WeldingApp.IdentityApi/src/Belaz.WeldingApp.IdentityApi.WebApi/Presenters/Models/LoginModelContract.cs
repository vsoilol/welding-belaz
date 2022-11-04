using System.ComponentModel.DataAnnotations;
using Belaz.WeldingApp.IdentityApi.WebApi.Attributes;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Models
{
    public class LoginModelContract
    {
        [Required]
        [CustomEmailAddress]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}
