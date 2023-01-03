using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;

/// <summary>
/// Проход для сварного шва
/// </summary>
public class WeldPassage : Entity
{
    public string Name { get; set; } = null!;
    
    public Guid SeamId { get; set; }
    
    [ForeignKey(nameof(SeamId))]
    public Seam Seam { get; set; } = null!;
    
    public Guid TechnologicalInstructionId { get; set; }
    
    [ForeignKey(nameof(TechnologicalInstructionId))]
    public TechnologicalInstruction TechnologicalInstruction { get; set; } = null!;
    
    public Guid LayerInstructionId { get; set; }
    
    [ForeignKey(nameof(LayerInstructionId))]
    public LayerInstruction LayerInstruction { get; set; } = null!;
}