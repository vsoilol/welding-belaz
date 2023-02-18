using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.Users
{
    /// <summary>
    /// Контролер УКК
    /// </summary>
    public class Inspector : Entity
    {
        public Guid UserId { get; set; }

        [ForeignKey(nameof(UserId))] 
        public UserData UserInfo { get; set; } = null!;

        public List<ManufacturedProduct> ManufacturedProducts { get; set; } = null!;
        
        public List<ManufacturedSeam> ManufacturedSeams { get; set; } = null!;
    }
}