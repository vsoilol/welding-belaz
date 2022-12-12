using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class WeldingEquipmentConditionTimeRepository : EntityFrameworkRepository<WeldingEquipmentConditionTime>
{
    public WeldingEquipmentConditionTimeRepository(ApplicationContext context,
        ILogger<EntityFrameworkRepository<WeldingEquipmentConditionTime>> logger) : base(context, logger)
    {
    }
}
