using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class PostRepository : EntityFrameworkRepository<Post>
{
    public PostRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Post>> logger) : base(context, logger)
    {
    }
    
    public override async Task<bool> UpdateAsync(Post entity)
    {
        var updatedPost = await Entities.FirstOrDefaultAsync(_ => _.Id == entity.Id);

        if (updatedPost is null)
        {
            return false;
        }
        
        updatedPost.Number = entity.Number;
        updatedPost.ProductionAreaId = entity.ProductionAreaId;
        
        await Context.SaveChangesAsync();

        return true;
    }
}