using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.FileApi.Domain.Entities.ProductInfo;

public class ProductInside
{
    public Guid MainProductId { get; set; }

    [ForeignKey(nameof(MainProductId))]
    public Product MainProduct { get; set; } = null!;

    public Guid InsideProductId { get; set; }

    [ForeignKey(nameof(InsideProductId))]
    public Product InsideProduct { get; set; } = null!;
}
