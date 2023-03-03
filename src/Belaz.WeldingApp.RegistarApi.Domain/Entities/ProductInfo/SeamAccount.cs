using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.RegistarApi.Domain.Entities.ProductInfo;

public class SeamAccount : Entity
{
    public DateTime DateFromPlan { get; set; }

    public List<SeamResult> SeamResults { get; set; } = null!;

    public Guid SeamId { get; set; }

    [ForeignKey(nameof(SeamId))]
    public Seam Seam { get; set; } = null!;
}
