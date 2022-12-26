using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class WorkplaceRepository : EntityFrameworkRepository<Workplace>
{
    public WorkplaceRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Workplace>> logger) : base(context, logger)
    {
    }
}