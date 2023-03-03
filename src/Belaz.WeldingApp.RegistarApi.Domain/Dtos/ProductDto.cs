using Belaz.WeldingApp.RegistarApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Mappings;

namespace Belaz.WeldingApp.RegistarApi.Domain.Dtos;

public class ProductDto : IMapFrom<Product>
{
    public Guid Id { get; set; }

    public string Name { get; set; } = null!;

    public string Number { get; set; } = null!;
}
