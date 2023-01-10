using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations
{
    public class InspectorRepository : EntityFrameworkRepository<Inspector>
    {
        public InspectorRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Inspector>> logger) : base(
        context, logger)
        {
        }
    }
}
