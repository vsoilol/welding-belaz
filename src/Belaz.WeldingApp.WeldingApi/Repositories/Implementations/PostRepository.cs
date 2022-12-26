using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class PostRepository : EntityFrameworkRepository<Post>
{
    public PostRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Post>> logger) : base(context, logger)
    {
    }
}