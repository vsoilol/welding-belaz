using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TechnologicalProcessInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;

/// <summary>
/// Сварной шов
/// </summary>
public class Seam : Entity
{
    public int Number { get; set; }

    public int Length { get; set; }

    /// <summary>
    /// Подлежит ли контролю
    /// </summary>
    public bool IsControlSubject { get; set; }

    /// <summary>
    /// Поддлежит ли исполнению на регистраторе
    /// </summary>
    public bool IsPerformed { get; set; } = false;

    public Guid? ProductId { get; set; }

    [ForeignKey(nameof(ProductId))] 
    public Product? Product { get; set; } = null!;

    public Guid? TechnologicalInstructionId { get; set; }

    [ForeignKey(nameof(TechnologicalInstructionId))]
    public TechnologicalInstruction? TechnologicalInstruction { get; set; }

    public List<WeldingTask> WeldingTasks { get; set; } = null!;
    
    public Guid? InspectorId { get; set; }

    [ForeignKey(nameof(InspectorId))] 
    public Inspector? Inspector { get; set; }
    
    public Guid? ProductionAreaId { get; set; }

    [ForeignKey(nameof(ProductionAreaId))] 
    public ProductionArea? ProductionArea { get; set; }
}