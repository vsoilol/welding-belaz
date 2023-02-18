using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.IdentityUser;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;

/// <summary>
/// Производственный участок
/// </summary>
public class ProductionArea : Entity
{
    public string Name { get; set; } = null!;

    public int Number { get; set; }

    public Guid WorkshopId { get; set; }

    [ForeignKey(nameof(WorkshopId))] public Workshop Workshop { get; set; } = null!;

    public List<Post> Posts { get; set; } = null!;

    public List<Workplace> Workplaces { get; set; } = null!;

    public List<UserData> Users { get; set; } = null!;
}