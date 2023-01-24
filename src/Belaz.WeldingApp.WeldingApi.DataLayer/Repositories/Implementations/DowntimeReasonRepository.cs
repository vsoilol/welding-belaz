using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class DowntimeReasonRepository : EntityFrameworkRepository<DowntimeReason>
{
    public DowntimeReasonRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<DowntimeReason>> logger) : base(context, logger)
    {
    }
}