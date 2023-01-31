using System.ComponentModel.DataAnnotations.Schema;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;

public class StatusReason : Entity
{
    public DateTime Date { get; set; }

    public ProductStatus Status { get; set; }

    public string Reason { get; set; } = null!;

    public Guid? ProductId { get; set; }
    
    [ForeignKey(nameof(ProductId))]
    public Product? Product { get; set; }
    
    public Guid? SeamId { get; set; }
    
    [ForeignKey(nameof(SeamId))]
    public Seam? Seam { get; set; }
}