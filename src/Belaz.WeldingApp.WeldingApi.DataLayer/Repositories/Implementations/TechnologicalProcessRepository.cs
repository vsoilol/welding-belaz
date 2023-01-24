using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class TechnologicalProcessRepository : EntityFrameworkRepository<TechnologicalProcess>
{
    public TechnologicalProcessRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<TechnologicalProcess>> logger) : base(context, logger)
    {
    }
}