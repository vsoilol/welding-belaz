using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class SeamRepository : EntityFrameworkRepository<Seam>
{
    public SeamRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Seam>> logger) : base(context, logger)
    {
    }
}