using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;

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

    public Guid? ProductId { get; set; }
        
    [ForeignKey(nameof(ProductId))]
    public Product? Product { get; set; }

    public WeldingTask? WeldingTask { get; set; }

    public List<WeldPassage> WeldPassages { get; set; } = null!;
    
    public TechnologicalInstruction? TechnologicalInstruction { get; set; }
}