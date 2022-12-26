using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class WorkshopRepository : EntityFrameworkRepository<Workshop>
{
    public WorkshopRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Workshop>> logger) : base(
        context, logger)
    {
    }
}