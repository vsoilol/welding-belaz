using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;

/// <summary>
/// Сварной шов
/// </summary>
public class Seam : Entity
{
    public int Number { get; set; }
    
    /// <summary>
    /// Подлежит ли контролю
    /// </summary>
    public bool IsControlSubject { get; set; }
    
    public Status Status { get; set; } = Status.NotStarted;

    public Guid? ProductId { get; set; }
        
    [ForeignKey(nameof(ProductId))]
    public Product? Product { get; set; }

    public WeldingTask? WeldingTask { get; set; }

    public List<WeldPassage> WeldPassages { get; set; } = null!;
    
    public TechnologicalInstruction? TechnologicalInstruction { get; set; }
    
    public Guid? ProductionAreaId { get; set; }
    
    [ForeignKey(nameof(ProductionAreaId))]
    public ProductionArea? ProductionArea { get; set; }
        
    public Guid? WorkplaceId { get; set; }
    
    [ForeignKey(nameof(WorkplaceId))]
    public Workplace? Workplace { get; set; }
    
    public List<StatusReason> StatusReasons { get; set; } = null!;
}