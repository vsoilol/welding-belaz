using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;

public class ProductBridge
{
    public Guid? DetailId { get; set; }
        
    [ForeignKey(nameof(DetailId))]
    public Detail? Detail { get; set; }
    
    public Guid? KnotId { get; set; }
        
    [ForeignKey(nameof(KnotId))]
    public Knot? Knot { get; set; }
    
    public Guid? ProductId { get; set; }
        
    [ForeignKey(nameof(ProductId))]
    public Product? Product { get; set; }
    
    public Guid? SeamId { get; set; }
        
    [ForeignKey(nameof(SeamId))]
    public Seam? Seam { get; set; }
}