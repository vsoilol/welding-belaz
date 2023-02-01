using AutoMapper;
using Belaz.WeldingApp.FileApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

public class ProductInsideDto : IMapFrom<ProductInside>
{
    public ProductDto? MainProduct { get; set; }
    
    public Guid MainProductId { get; set; }
}