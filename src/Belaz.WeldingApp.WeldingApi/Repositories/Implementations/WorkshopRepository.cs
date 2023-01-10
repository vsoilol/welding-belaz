using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class WorkshopRepository : EntityFrameworkRepository<Workshop>
{
    public WorkshopRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Workshop>> logger) : base(
        context, logger)
    {
    }

    public override async Task<bool> UpdateAsync(Workshop entity)
    {
        var updatedWorkshop = await Entities.FirstOrDefaultAsync(_ => _.Id == entity.Id);

        if (updatedWorkshop is null)
        {
            return false;
        }

        updatedWorkshop.Name = entity.Name;
        updatedWorkshop.Number = entity.Number;
        
        await Context.SaveChangesAsync();

        return true;
    }
}