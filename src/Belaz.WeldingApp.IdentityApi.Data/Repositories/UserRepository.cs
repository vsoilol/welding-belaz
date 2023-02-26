using System.Linq.Expressions;
using Belaz.WeldingApp.IdentityApi.Data.DataAccess;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace Belaz.WeldingApp.IdentityApi.Data.Repositories
{
    public class UserRepository : EntityFrameworkRepository<UserData>
    {
        public UserRepository(
            IdentityDbContext context,
            ILogger<EntityFrameworkRepository<UserData>> logger
        )
            : base(context, logger) { }

        protected new IdentityDbContext Context => base.Context;

        public override IQueryable<UserData> AsQueryable()
        {
            return Context.Users.AsQueryable().Include(x => x.UserRoles).ThenInclude(x => x.Role);
        }

        public override async Task<IEnumerable<UserData>> GetAllAsync()
        {
            return await Context.Users
                .Include(x => x.UserRoles)
                .ThenInclude(x => x.Role)
                .ToListAsync();
        }

        public override async Task<IEnumerable<UserData>> GetByFilterAsync(
            Expression<Func<UserData, bool>> filter
        )
        {
            return await Context.Users
                .Where(filter)
                .Include(x => x.UserRoles)
                .ThenInclude(x => x.Role)
                .Include(_ => _.ProductionArea)
                .ToListAsync();
        }

        public override async Task<UserData> GetByIdAsync(Guid id)
        {
            return await Context.Users
                .Where(x => x.Id == id)
                .Include(x => x.UserRoles)
                .ThenInclude(x => x.Role)
                .FirstOrDefaultAsync();
        }
    }
}
