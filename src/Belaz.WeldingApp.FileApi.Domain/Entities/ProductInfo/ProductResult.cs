using System.ComponentModel.DataAnnotations.Schema;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.FileApi.Domain.Entities.ProductInfo;

public class ProductResult : Entity
{
    public int Amount { get; set; }

    public ResultProductStatus Status { get; set; }

    public string? Reason { get; set; }

    public string? DetectedDefects { get; set; }

    public Guid ProductAccountId { get; set; }

    [ForeignKey(nameof(ProductAccountId))]
    public ProductAccount ProductAccount { get; set; } = null!;
}
