using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class StatusReasonRepository : EntityFrameworkRepository<StatusReason>
{
    public StatusReasonRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<StatusReason>> logger) : base(context, logger)
    {
    }
    
    public override async Task<bool> UpdateAsync(StatusReason entity)
    {
        var updatedStatusReason = await Entities.FirstOrDefaultAsync(_ => _.Id == entity.Id);

        if (updatedStatusReason is null)
        {
            return false;
        }

        updatedStatusReason.Date = entity.Date;
        updatedStatusReason.SeamId = entity.SeamId;
        updatedStatusReason.Reason = entity.Reason;
        
        await Context.SaveChangesAsync();

        return true;
    }
}