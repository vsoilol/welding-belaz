using Belaz.WeldingApp.WeldingApi.Repositories.Entities.WeldingEquipmentInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class WeldingEquipmentRepository : EntityFrameworkRepository<WeldingEquipment>
{
    public WeldingEquipmentRepository(ApplicationContext context,
        ILogger<EntityFrameworkRepository<WeldingEquipment>> logger) : base(context, logger)
    {
    }

    public override async Task<bool> UpdateAsync(WeldingEquipment entity)
    {
        var updatedWeldingEquipment = await Entities.FirstOrDefaultAsync(_ => _.Id == entity.Id);

        if (updatedWeldingEquipment is null)
        {
            return false;
        }

        updatedWeldingEquipment.PostId = entity.PostId;
        updatedWeldingEquipment.ArcVoltageMax = entity.ArcVoltageMax;
        updatedWeldingEquipment.ArcVoltageMin = entity.ArcVoltageMin;
        updatedWeldingEquipment.WeldingCurrentMax = entity.WeldingCurrentMax;
        updatedWeldingEquipment.WeldingCurrentMin = entity.WeldingCurrentMin;
        updatedWeldingEquipment.IdleVoltage = entity.IdleVoltage;
        updatedWeldingEquipment.WeldingProcess = entity.WeldingProcess;
        updatedWeldingEquipment.NextAttestationDate = entity.NextAttestationDate;
        updatedWeldingEquipment.ManufacturerName = entity.ManufacturerName;
        updatedWeldingEquipment.GroupNumber = entity.GroupNumber;
        updatedWeldingEquipment.Lenght = entity.Lenght;
        updatedWeldingEquipment.Width = entity.Width;
        updatedWeldingEquipment.Height = entity.Height;
        updatedWeldingEquipment.CommissioningDate = entity.CommissioningDate;
        updatedWeldingEquipment.FactoryNumber = entity.FactoryNumber;
        updatedWeldingEquipment.Marking = entity.Marking;
        updatedWeldingEquipment.Name = entity.Name;
        updatedWeldingEquipment.RfidTag = entity.RfidTag;
        
        await Context.SaveChangesAsync();

        return true;
    }
}
