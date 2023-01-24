using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.Production;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class WorkplaceRepository : EntityFrameworkRepository<Workplace>
{
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

    public WorkplaceRepository(ApplicationContext context) : base(context)
    {
    }
}