using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Entities.Users
{
    /// <summary>
    /// Контролер УКК
    /// </summary>
    public class Inspector : Entity
    {
        public Guid UserId { get; set; }

        [ForeignKey(nameof(UserId))] 
        public UserData UserInfo { get; set; } = null!;

        public List<Product> Products { get; set; } = null!;
        
        public List<Seam> Seams { get; set; } = null!;
    }
}