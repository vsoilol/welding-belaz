using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.FileApi.Domain.Entities;
using Belaz.WeldingApp.FileApi.Domain.Entities.Production;
using Belaz.WeldingApp.FileApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.FileApi.Domain.Entities.Users;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.FileApi.Domain.Entities.ProductInfo;

/// <summary>
/// Сварной шов
/// </summary>
public class Seam : Entity
{
    public int Number { get; set; }

    public ProductStatus Status { get; set; } = ProductStatus.NotManufactured;
    
    /// <summary>
    /// Подлежит ли контролю
    /// </summary>
    public bool IsControlSubject { get; set; }

    /// <summary>
    /// Добавлен ли вручную
    /// </summary>
    public bool IsAddManually { get; set; }

    public Guid? ProductId { get; set; }

    [ForeignKey(nameof(ProductId))] public Product? Product { get; set; }

    public WeldingTask? WeldingTask { get; set; }

    public List<WeldPassage> WeldPassages { get; set; } = null!;

    public TechnologicalInstruction? TechnologicalInstruction { get; set; }

    public Guid? ProductionAreaId { get; set; }

    [ForeignKey(nameof(ProductionAreaId))] public ProductionArea? ProductionArea { get; set; }

    public Guid? WorkplaceId { get; set; }

    [ForeignKey(nameof(WorkplaceId))] public Workplace? Workplace { get; set; }

    public List<StatusReason> StatusReasons { get; set; } = null!;

    public Guid? WelderId { get; set; }

    [ForeignKey(nameof(WelderId))] public Welder? Welder { get; set; }

    public Guid? InspectorId { get; set; }

    [ForeignKey(nameof(InspectorId))] public Inspector? Inspector { get; set; }
}