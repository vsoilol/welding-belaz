using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.FileApi.Domain.Entities.TaskInfo;

namespace Belaz.WeldingApp.FileApi.Domain.Entities.ProductInfo;

public class SeamAccount : Entity
{
    public DateTime DateFromPlan { get; set; }

    public List<SeamResult> SeamResults { get; set; } = null!;

    public Guid SeamId { get; set; }

    [ForeignKey(nameof(SeamId))]
    public Seam Seam { get; set; } = null!;

    public List<WeldingTask> WeldingTasks { get; set; } = null!;

    public Guid ProductAccountId { get; set; }

    [ForeignKey(nameof(ProductAccountId))]
    public ProductAccount ProductAccount { get; set; } = null!;
}
