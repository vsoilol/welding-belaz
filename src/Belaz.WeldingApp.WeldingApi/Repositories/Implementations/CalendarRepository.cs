using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class CalendarRepository : EntityFrameworkRepository<Calendar>
{
    public CalendarRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Calendar>> logger) : base(context, logger)
    {
    }
    
    public override async Task<bool> UpdateAsync(Calendar entity)
    {
        var updatedCalendar = await Entities
            .FirstOrDefaultAsync(_ => _.Id == entity.Id);

        if (updatedCalendar is null)
        {
            return false;
        }

        updatedCalendar.Year = entity.Year;

        await Context.SaveChangesAsync();

        return true;
    }
}