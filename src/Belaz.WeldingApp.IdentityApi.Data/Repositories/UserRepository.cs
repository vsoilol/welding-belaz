using System.Linq.Expressions;
using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.IdentityApi.Data.DataAccess;
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
            return Context.Users.AsQueryable();
        }

        public override async Task<IEnumerable<UserData>> GetAllAsync()
        {
            return await Context.Users
                .ToListAsync();
        }

        public override async Task<IEnumerable<UserData>> GetByFilterAsync(
            Expression<Func<UserData, bool>> filter
        )
        {
            return await Context.Users
                .Where(filter)
                .Include(_ => _.ProductionArea)
                .ToListAsync();
        }

        public override async Task<UserData> GetByIdAsync(Guid id)
        {
            return await Context.Users
                .Where(x => x.Id == id)
                .FirstOrDefaultAsync();
        }
    }
}
