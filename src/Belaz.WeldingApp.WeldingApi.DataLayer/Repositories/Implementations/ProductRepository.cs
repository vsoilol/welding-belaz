using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class ProductRepository: EntityFrameworkRepository<Product>
{
    public ProductRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Product>> logger) : base(context, logger)
    {
    }
}