using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class ProductRepository: EntityFrameworkRepository<Product>
{
    public ProductRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Product>> logger) : base(context, logger)
    {
    }
}