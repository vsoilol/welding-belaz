using Belaz.WeldingApp.WeldingApi.Repositories.Entities.CalendarInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class WorkingShiftRepository : EntityFrameworkRepository<WorkingShift>
{
    public WorkingShiftRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<WorkingShift>> logger) : base(context, logger)
    {
    }

    public override async Task<bool> UpdateRangeAsync(IEnumerable<WorkingShift> entities)
    {
        var entityDict = await Entities
            .Where(_ => entities.Any(workingShift => workingShift.Id == _.Id))
            .ToDictionaryAsync(e => e.Id);
        
        foreach (var day in entities)
        {
            if (entityDict.TryGetValue(day.Id, out WorkingShift? updatedWorkingShift))
            {
                updatedWorkingShift.Number = day.Number;
                updatedWorkingShift.ShiftStart = day.ShiftStart;
                updatedWorkingShift.ShiftEnd = day.ShiftEnd;
                updatedWorkingShift.BreakStart = day.BreakStart;
                updatedWorkingShift.BreakEnd = day.BreakEnd;
            }
        }

        await Context.SaveChangesAsync();

        return true;
    }
}