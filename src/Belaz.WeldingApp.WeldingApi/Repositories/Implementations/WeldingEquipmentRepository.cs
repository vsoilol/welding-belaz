using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class WeldingEquipmentRepository : EntityFrameworkRepository<WeldingEquipment>
{
    public WeldingEquipmentRepository(ApplicationContext context,
        ILogger<EntityFrameworkRepository<WeldingEquipment>> logger) : base(context, logger)
    {
    }
}
