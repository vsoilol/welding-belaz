using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class WeldingEquipmentConditionTimeRepository : EntityFrameworkRepository<WeldingEquipmentConditionTime>
{
    public WeldingEquipmentConditionTimeRepository(ApplicationContext context,
        ILogger<EntityFrameworkRepository<WeldingEquipmentConditionTime>> logger) : base(context, logger)
    {
    }
    
    public override async Task<bool> UpdateAsync(WeldingEquipmentConditionTime entity)
    {
        var updatedWeldingEquipmentConditionTime = await Entities.FirstOrDefaultAsync(_ => _.Id == entity.Id);

        if (updatedWeldingEquipmentConditionTime is null)
        {
            return false;
        }

        updatedWeldingEquipmentConditionTime.Condition = entity.Condition;
        updatedWeldingEquipmentConditionTime.Date = entity.Date;
        updatedWeldingEquipmentConditionTime.StartConditionTime = entity.StartConditionTime;
        updatedWeldingEquipmentConditionTime.Time = entity.Time;
        updatedWeldingEquipmentConditionTime.WeldingEquipmentId = entity.WeldingEquipmentId;
        updatedWeldingEquipmentConditionTime.DowntimeReasonId = entity.DowntimeReasonId;

        await Context.SaveChangesAsync();

        return true;
    }
}
