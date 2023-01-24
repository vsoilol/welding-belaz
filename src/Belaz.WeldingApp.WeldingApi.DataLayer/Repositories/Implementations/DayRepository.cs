using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.CalendarInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class DayRepository : EntityFrameworkRepository<Day>
{
    public DayRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Day>> logger) : base(context, logger)
    {
    }
    
    public override async Task<bool> UpdateAsync(Day entity)
    {
        var updatedDay = await Entities
            .FirstOrDefaultAsync(_ => _.Id == entity.Id);

        if (updatedDay is null)
        {
            return false;
        }

        updatedDay.MonthNumber = entity.MonthNumber;
        updatedDay.Number = entity.Number;
        updatedDay.IsWorkingDay = entity.IsWorkingDay;

        await Context.SaveChangesAsync();

        return true;
    }
    
    public override async Task<bool> UpdateRangeAsync(IEnumerable<Day> entities)
    {
        var entityDict = await Entities
            .Where(_ => entities.Any(day => day.Id == _.Id))
            .ToDictionaryAsync(e => e.Id);
        
        foreach (var day in entities)
        {
            if (entityDict.TryGetValue(day.Id, out Day? updatedDay))
            {
                updatedDay.MonthNumber = day.MonthNumber;
                updatedDay.Number = day.Number;
                updatedDay.IsWorkingDay = day.IsWorkingDay;
            }
        }

        await Context.SaveChangesAsync();

        return true;
    }
}