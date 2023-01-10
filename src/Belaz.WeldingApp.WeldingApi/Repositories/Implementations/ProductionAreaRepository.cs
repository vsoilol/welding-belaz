using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class ProductionAreaRepository : EntityFrameworkRepository<ProductionArea>
{
    public ProductionAreaRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<ProductionArea>> logger) : base(context, logger)
    {
    }
    
    public override async Task<bool> UpdateAsync(ProductionArea entity)
    {
        var updatedProductionArea = await Entities.FirstOrDefaultAsync(_ => _.Id == entity.Id);

        if (updatedProductionArea is null)
        {
            return false;
        }

        updatedProductionArea.Name = entity.Name;
        updatedProductionArea.Number = entity.Number;
        updatedProductionArea.WorkshopId = entity.WorkshopId;
        
        await Context.SaveChangesAsync();

        return true;
    }
}