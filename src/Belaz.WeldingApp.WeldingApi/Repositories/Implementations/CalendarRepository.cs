using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class CalendarRepository : EntityFrameworkRepository<Calendar>
{
    public CalendarRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Calendar>> logger) : base(context, logger)
    {
    }
}