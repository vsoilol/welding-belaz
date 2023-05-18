using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;

public class ProductAccountAmountFromPlanDto : IMapFrom<ProductAccount>
{
    public Guid Id { get; set; }
    
    public int AmountFromPlan { get; set; }
    
    public DateTime DateFromPlan { get; set; }
}