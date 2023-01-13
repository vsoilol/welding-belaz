﻿using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Users;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Implementations;

public class WelderRepository : EntityFrameworkRepository<Welder>
{
    public WelderRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Welder>> logger) : base(
        context, logger)
    {
    }
    
    public override async Task<bool> UpdateAsync(Welder entity)
    {
        var updatedWelder = await Entities
            .Include(_ => _.UserInfo)
            .FirstOrDefaultAsync(_ => _.Id == entity.Id);

        if (updatedWelder is null)
        {
            return false;
        }

        updatedWelder.WeldingEquipmentId = entity.WeldingEquipmentId;
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
