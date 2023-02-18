using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.IdentityUser;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.TaskInfo;

namespace Belaz.WeldingApp.RegistarApi.Domain.Entities.Users;

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
}