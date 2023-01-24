using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class SeamRepository : EntityFrameworkRepository<Seam>
{
    public SeamRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Seam>> logger) : base(context, logger)
    {
    }
}