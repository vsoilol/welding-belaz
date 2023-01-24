using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.CalendarInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class WorkingShiftRepository : EntityFrameworkRepository<WorkingShift>
{

    
    public override async Task<bool> UpdateAsync(WorkingShift entity)
    {
        var updatedWorkingShift = await Entities
            .FirstOrDefaultAsync(_ => _.Id == entity.Id);

        if (updatedWorkingShift is null)
        {
            return false;
        }

        updatedWorkingShift.Number = entity.Number;
        updatedWorkingShift.ShiftStart = entity.ShiftStart;
        updatedWorkingShift.ShiftEnd = entity.ShiftEnd;
        updatedWorkingShift.BreakStart = entity.BreakStart;
        updatedWorkingShift.BreakEnd = entity.BreakEnd;

        await Context.SaveChangesAsync();

        return true;
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

    public WorkingShiftRepository(ApplicationContext context) : base(context)
    {
    }
}