using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations
{
    public class ChiefRepository : EntityFrameworkRepository<Chief>
    {
        public ChiefRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Chief>> logger) : base(
        context, logger)
        {
        }
    }
}
