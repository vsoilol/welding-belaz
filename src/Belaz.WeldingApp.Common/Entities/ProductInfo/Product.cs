using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo;
using Belaz.WeldingApp.Common.Entities.Users;

namespace Belaz.WeldingApp.Common.Entities.ProductInfo;

/// <summary>
/// Изделие
/// </summary>
public class Product : Entity
{
    public string Name { get; set; } = null!;

    public string Number { get; set; } = null!;

    /// <summary>
    /// Подлежит ли контролю
    /// </summary>
    public bool IsControlSubject { get; set; } = true;

    /// <summary>
    /// Норма времени на изготовление
    /// </summary>
    public double ManufacturingTime { get; set; } = 0;

    public ProductType ProductType { get; set; }

    public Guid? TechnologicalProcessId { get; set; }

    [ForeignKey(nameof(TechnologicalProcessId))]
    public TechnologicalProcess? TechnologicalProcess { get; set; }

    public List<Seam> Seams { get; set; } = null!;

    public List<ProductInside> ProductInsides { get; set; } = null!;

    public ProductInside? ProductMain { get; set; }

    public List<ProductAccount> ProductAccounts { get; set; } = null!;

    public Guid ProductionAreaId { get; set; }

    [ForeignKey(nameof(ProductionAreaId))]
    public ProductionArea ProductionArea { get; set; } = null!;

    public Guid? MasterId { get; set; }

    [ForeignKey(nameof(MasterId))]
    public Master? Master { get; set; }

    public Guid? InspectorId { get; set; }

    [ForeignKey(nameof(InspectorId))]
    public Inspector? Inspector { get; set; }
}
