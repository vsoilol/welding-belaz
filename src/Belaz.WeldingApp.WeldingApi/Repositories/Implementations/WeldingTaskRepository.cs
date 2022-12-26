using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class WeldingTaskRepository : EntityFrameworkRepository<WeldingTask>
{
    public WeldingTaskRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<WeldingTask>> logger) : base(context, logger)
    {
    }
}