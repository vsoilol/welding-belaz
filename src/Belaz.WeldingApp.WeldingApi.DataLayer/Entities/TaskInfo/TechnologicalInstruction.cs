using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Entities.TaskInfo;

public class TechnologicalInstruction : Entity
{
    public int Number { get; set; }

    public string Name { get; set; } = null!;

    public List<WeldPassage> WeldPassages { get; set; } = null!;
    
    public Guid SeamId { get; set; }
        
    [ForeignKey(nameof(SeamId))]
    public Seam Seam { get; set; } = null!;
    
    public Guid? TechnologicalProcessId { get; set; }
        
    [ForeignKey(nameof(TechnologicalProcessId))]
    public TechnologicalProcess? TechnologicalProcess { get; set; }
}