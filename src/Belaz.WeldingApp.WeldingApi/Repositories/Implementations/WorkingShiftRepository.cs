using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class WorkingShiftRepository : EntityFrameworkRepository<WorkingShift>
{
    public WorkingShiftRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<WorkingShift>> logger) : base(context, logger)
    {
    }
}