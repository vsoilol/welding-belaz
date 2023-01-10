using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class WorkplaceRepository : EntityFrameworkRepository<Workplace>
{
    public WorkplaceRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Workplace>> logger) : base(context, logger)
    {
    }
    
    public override async Task<bool> UpdateAsync(Workplace entity)
    {
        var updatedWorkplace = await Entities.FirstOrDefaultAsync(_ => _.Id == entity.Id);

        if (updatedWorkplace is null)
        {
            return false;
        }
        
        updatedWorkplace.Number = entity.Number;
        updatedWorkplace.ProductionAreaId = entity.ProductionAreaId;
        updatedWorkplace.PostId = entity.PostId;
        
        await Context.SaveChangesAsync();

        return true;
    }
}