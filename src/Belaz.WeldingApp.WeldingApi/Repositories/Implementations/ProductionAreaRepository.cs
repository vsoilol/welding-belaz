using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class ProductionAreaRepository : EntityFrameworkRepository<ProductionArea>
{
    public ProductionAreaRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<ProductionArea>> logger) : base(context, logger)
    {
    }
}