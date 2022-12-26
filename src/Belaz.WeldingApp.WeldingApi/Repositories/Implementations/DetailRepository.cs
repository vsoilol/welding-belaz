using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class DetailRepository : EntityFrameworkRepository<Detail>
{
    public DetailRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Detail>> logger) : base(context, logger)
    {
    }
}