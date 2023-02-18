using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TechnologicalProcessInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;

/// <summary>
/// Изделие
/// </summary>
public class Product : Entity
{
    public string Name { get; set; } = null!;

    public string Number { get; set; } = null!;

    public ProductType ProductType { get; set; }

    public Guid? TechnologicalProcessId { get; set; }

    [ForeignKey(nameof(TechnologicalProcessId))]
    public TechnologicalProcess? TechnologicalProcess { get; set; }

    public List<Seam> Seams { get; set; } = null!;

    public List<ProductInside> ProductInsides { get; set; } = null!;

    public ProductInside? ProductMain { get; set; }

    public List<ManufacturedProduct> ManufacturedProducts { get; set; } = null!;
}