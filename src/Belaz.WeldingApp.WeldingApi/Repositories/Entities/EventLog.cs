using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.IdentityUser;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities
{
    public class EventLog : Entity
    {
        [Required]
        [MaxLength(200)]
        public string Information { get; set; }
        
        [Required]
        public DateTime DateTime { get; set; }
        
        public Guid? UserId { get; set; }
        
        [ForeignKey(nameof(UserId))]
        public UserData? User { get; set; }
    }
}