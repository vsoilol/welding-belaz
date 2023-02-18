using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;

public class ProductAccount : Entity
{
    public int AmountFromPlan { get; set; }

    public DateTime DateFromPlan { get; set; }

    public List<ProductResult> ProductResults { get; set; } = null!;
    
    public Guid ProductId { get; set; }

    [ForeignKey(nameof(ProductId))] 
    public Product Product { get; set; } = null!;
}