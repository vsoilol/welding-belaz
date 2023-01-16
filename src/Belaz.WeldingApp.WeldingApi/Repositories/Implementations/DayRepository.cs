using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class DayRepository : EntityFrameworkRepository<Day>
{
    public DayRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Day>> logger) : base(context, logger)
    {
    }
}