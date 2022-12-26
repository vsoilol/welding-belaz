using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class KnotRepository : EntityFrameworkRepository<Knot>
{
    public KnotRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Knot>> logger) : base(context, logger)
    {
    }
}