using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.Common.Entities.Users;

/// <summary>
/// Руководитель сварочных работ / Мастер
/// </summary>
public class Master : Entity
{
    public Guid UserId { get; set; }

    [ForeignKey(nameof(UserId))]
    public UserData UserInfo { get; set; } = null!;

    public List<WeldingEquipment> WeldingEquipments { get; set; } = null!;

    public List<Product> Products { get; set; } = null!;

    public List<WeldingTask> WeldingTasks { get; set; } = null!;

    public List<WeldingRecord> WeldingRecords { get; set; } = null!;
    
    public List<ProductAccountTask> ProductAccountTasks { get; set; } = null!;
}
