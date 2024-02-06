using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Entities.TaskInfo;

namespace Belaz.WeldingApp.Common.Entities.Users;

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

    public List<WeldingTask> WeldingTasks { get; set; } = null!;
    
    public List<ProductAccountTask> ProductAccountTasks { get; set; } = null!;
}
