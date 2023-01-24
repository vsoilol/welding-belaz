using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.Users;
using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.WeldingEquipmentInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class WelderRepository : EntityFrameworkRepository<Welder>
{
    private readonly EntityFrameworkRepository<WeldingEquipment> _welderEquipmentRepository;

    public WelderRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Welder>> logger,
        EntityFrameworkRepository<WeldingEquipment> welderEquipmentRepository) : base(
        context, logger)
    {
        _welderEquipmentRepository = welderEquipmentRepository;
    }

    public override async Task<bool> UpdateAsync(Welder entity)
    {
        var updatedWelder = await Entities
            .Include(_ => _.UserInfo)
            .Include(_ => _.WeldingEquipments)
            .FirstOrDefaultAsync(_ => _.Id == entity.Id);

        if (updatedWelder is null)
        {
            return false;
        }

        var weldingEquipments = await _welderEquipmentRepository
            .AsQueryableByFilter(_ => entity.WeldingEquipments
                .Select(equipment => equipment.Id)
                .Any(equipmentId => equipmentId == _.Id))
            .ToListAsync();

        if (weldingEquipments.Any(_ => _.WelderId is not null && _.WelderId != entity.Id))
        {
            return false;
        }

        updatedWelder.WeldingEquipments = weldingEquipments;
        updatedWelder.WorkplaceId = entity.WorkplaceId;
        updatedWelder.UserInfo.RfidTag = entity.UserInfo.RfidTag;
        updatedWelder.UserInfo.FirstName = entity.UserInfo.FirstName;
        updatedWelder.UserInfo.MiddleName = entity.UserInfo.MiddleName;
        updatedWelder.UserInfo.LastName = entity.UserInfo.LastName;
        updatedWelder.UserInfo.ProductionAreaId = entity.UserInfo.ProductionAreaId;

        await Context.SaveChangesAsync();

        return true;
    }
}