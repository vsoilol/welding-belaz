using Belaz.WeldingApp.WeldingApi.DataLayer.Entities.Users;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations
{
    public class ChiefRepository : EntityFrameworkRepository<Chief>
    {
        public ChiefRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<Chief>> logger) : base(
        context, logger)
        {
        }
        
        public override async Task<bool> UpdateAsync(Chief entity)
        {
            var updatedWelder = await Entities
                .Include(_ => _.UserInfo)
                .FirstOrDefaultAsync(_ => _.Id == entity.Id);

            if (updatedWelder is null)
            {
                return false;
            }

            updatedWelder.WeldingEquipmentId = entity.WeldingEquipmentId;
            updatedWelder.UserInfo.RfidTag = entity.UserInfo.RfidTag;
            updatedWelder.UserInfo.FirstName = entity.UserInfo.FirstName;
            updatedWelder.UserInfo.MiddleName = entity.UserInfo.MiddleName;
            updatedWelder.UserInfo.LastName = entity.UserInfo.LastName;
            updatedWelder.UserInfo.ProductionAreaId = entity.UserInfo.ProductionAreaId;

            await Context.SaveChangesAsync();

            return true;
        }
    }
}
