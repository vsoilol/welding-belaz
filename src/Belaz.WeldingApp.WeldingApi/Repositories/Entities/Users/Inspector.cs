using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users
{
    /// <summary>
    /// Контролер УКК
    /// </summary>
    public class Inspector : Entity
    {
        [Required]
        public Guid UserId { get; set; }
        
        [ForeignKey(nameof(UserId))]
        public UserData UserInfo { get; set; }
        
        public List<WeldingTask> WeldingTasks { get; set; }
    }
}