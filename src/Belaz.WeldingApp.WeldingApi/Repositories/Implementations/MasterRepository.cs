using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations
{
    public class MasterRepository : EntityFrameworkRepository<Master>
    {
        public MasterRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Master>> logger) : base(
        context, logger)
        {
        }
    }
}
