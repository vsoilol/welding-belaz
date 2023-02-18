using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;

/// <summary>
/// Рабочее место
/// </summary>
public class Workplace : Entity
{
    public int Number { get; set; }

    public Guid? PostId { get; set; }

    [ForeignKey(nameof(PostId))] public Post? Post { get; set; }

    public Guid? ProductionAreaId { get; set; }

    [ForeignKey(nameof(ProductionAreaId))] public ProductionArea? ProductionArea { get; set; }

    public List<Product> Products { get; set; } = null!;

    public List<Seam> Seams { get; set; } = null!;

    public List<Welder> Welders { get; set; } = null!;
}