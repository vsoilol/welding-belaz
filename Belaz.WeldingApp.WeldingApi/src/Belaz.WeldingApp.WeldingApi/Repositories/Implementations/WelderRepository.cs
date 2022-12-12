using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class WelderRepository : EntityFrameworkRepository<Welder>
{
    public WelderRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Welder>> logger) : base(
        context, logger)
    {
    }
}
