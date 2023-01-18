using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class DowntimeReasonRepository : EntityFrameworkRepository<DowntimeReason>
{
    public DowntimeReasonRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<DowntimeReason>> logger) : base(context, logger)
    {
    }
}