using Belaz.WeldingApp.IdentityApi.Data.DataAccess;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Microsoft.Extensions.Logging;

namespace Belaz.WeldingApp.IdentityApi.Data.Repositories
{
    public class RoleRepository : EntityFrameworkRepository<RoleData>
    {
        public RoleRepository(IdentityDbContext context, ILogger<EntityFrameworkRepository<RoleData>> logger) : base(context, logger)
        {
        }

        protected new IdentityDbContext Context => base.Context;
    }
}
