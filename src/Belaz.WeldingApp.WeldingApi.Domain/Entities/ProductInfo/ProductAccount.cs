using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;

public class ProductAccount : Entity
{
    public int Number { get; set; }

    public int AmountFromPlan { get; set; }

    public DateTime DateFromPlan { get; set; }

    public List<ProductResult> ProductResults { get; set; } = null!;

    public Guid ProductId { get; set; }

    [ForeignKey(nameof(ProductId))]
    public Product Product { get; set; } = null!;

    public List<Welder> Welders { get; set; } = null!;
}
