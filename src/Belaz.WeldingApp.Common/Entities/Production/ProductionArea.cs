using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Entities.ProductInfo;

namespace Belaz.WeldingApp.Common.Entities.Production;

/// <summary>
/// Производственный участок
/// </summary>
public class ProductionArea : Entity
{
    public string Name { get; set; } = null!;

    public int Number { get; set; }

    public Guid WorkshopId { get; set; }

    [ForeignKey(nameof(WorkshopId))]
    public Workshop Workshop { get; set; } = null!;

    public List<Post> Posts { get; set; } = null!;

    public List<Workplace> Workplaces { get; set; } = null!;

    public List<UserData> Users { get; set; } = null!;

    public List<Product> Products { get; set; } = null!;

    public List<Seam> Seams { get; set; } = null!;
}
