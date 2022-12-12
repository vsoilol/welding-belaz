using Belaz.WeldingApp.IdentityApi.Data.DataAccess;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace Belaz.WeldingApp.IdentityApi.Data.Repositories
{
    public class RoleRepository : EntityFrameworkRepository<RoleData>, IRoleRepository
    {
        public RoleRepository(IdentityDbContext context, ILogger<EntityFrameworkRepository<RoleData>> logger) : base(
            context, logger)
        {
        }

        protected new IdentityDbContext Context => base.Context;

        public Task<List<RoleData>> GetAllRolesByNames(List<string> names)
        {
            return Context.Roles.Where(_ => names.Any(name => _.Name.ToLower() == name))
                .ToListAsync();
        }

        public Task<RoleData?> GetRoleByName(string name)
        {
            return Context.Roles.FirstOrDefaultAsync(_ => _.Name == name);
        }
    }
}
