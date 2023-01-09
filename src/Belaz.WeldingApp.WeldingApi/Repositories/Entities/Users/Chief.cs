using Belaz.WeldingApp.WeldingApi.Repositories.Entities.IdentityUser;
using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users
{
    /// <summary>
    /// Начальник цеха
    /// </summary>
    public class Chief : Entity
    {
        public Guid UserId { get; set; }

        [ForeignKey(nameof(UserId))]
        public UserData UserInfo { get; set; }
    }
}
