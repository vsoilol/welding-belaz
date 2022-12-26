using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class TechnologicalProcessRepository : EntityFrameworkRepository<TechnologicalProcess>
{
    public TechnologicalProcessRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<TechnologicalProcess>> logger) : base(context, logger)
    {
    }
}