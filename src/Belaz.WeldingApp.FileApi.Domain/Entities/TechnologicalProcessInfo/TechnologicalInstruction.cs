using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.FileApi.Domain.Entities.ProductInfo;

namespace Belaz.WeldingApp.FileApi.Domain.Entities.TechnologicalProcessInfo;

public class TechnologicalInstruction : Entity
{
    public int Number { get; set; }

    public string Name { get; set; } = null!;

    public Guid SeamId { get; set; }

    [ForeignKey(nameof(SeamId))] 
    public Seam Seam { get; set; } = null!;

    public Guid? TechnologicalProcessId { get; set; }

    [ForeignKey(nameof(TechnologicalProcessId))]
    public TechnologicalProcess? TechnologicalProcess { get; set; }

    public List<WeldPassageInstruction> WeldPassageInstructions { get; set; } = null!;
}