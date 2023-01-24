using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class WeldingTaskRepository : EntityFrameworkRepository<WeldingTask>
{
    public WeldingTaskRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<WeldingTask>> logger) : base(context, logger)
    {
    }
}