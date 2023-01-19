using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class StatusReasonRepository : EntityFrameworkRepository<StatusReason>
{
    public StatusReasonRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<StatusReason>> logger) : base(context, logger)
    {
    }
}