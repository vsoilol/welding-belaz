using System.Linq.Expressions;
using Belaz.WeldingApp.IdentityApi.Data.DataAccess;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace Belaz.WeldingApp.IdentityApi.Data.Repositories
{
    public abstract class EntityFrameworkRepository<T> : IRepository<T>
        where T : Entity
    {
        private readonly DbSet<T> _entities;

        private readonly ILogger<EntityFrameworkRepository<T>> _logger;

        protected EntityFrameworkRepository(IdentityDbContext context, ILogger<EntityFrameworkRepository<T>> logger)
        {
            Context = context;
            _entities = context.Set<T>();
            _logger = logger;
        }

        protected IdentityDbContext Context { get; }

        public virtual IQueryable<T> AsQueryable()
        {
            return _entities.AsQueryable();
        }

        public virtual async Task<IEnumerable<T>> GetAllAsync()
        {
            return await _entities.ToListAsync();
        }

        public virtual async Task<IEnumerable<T>> GetByFilterAsync(Expression<Func<T, bool>> filter)
        {
            return await _entities.Where(filter).ToListAsync();
        }

        public virtual async Task<T> GetByIdAsync(Guid id)
        {
            return await _entities.FirstOrDefaultAsync(x => x.Id == id);
        }

        public virtual async Task<T> AddAsync(T entity)
        {
            return (await _entities.AddAsync(entity)).Entity;
        }

        public virtual bool Update(T entity)
        {
            _entities.Update(entity);

            return true;
        }

        public virtual async Task<bool> DeleteByIdAsync(Guid id)
        {
            var toDelete = await GetByIdAsync(id);

            _entities.Remove(toDelete);

            return true;
        }

        public async Task<bool> SaveAsync()
        {
            try
            {
                const int reTryMax = 5;
                var saved = false;
                var count = 0;
                var written = false;

                while (!saved && count < reTryMax)
                {
                    try
                    {
                        written = await Context.SaveChangesAsync() > 0;
                        saved = true;
                    }
                    catch (DbUpdateConcurrencyException e)
                    {
                        if (count < reTryMax)
                        {
                            _logger.LogWarning("Optimistic concurrency error, retrying!");

                            foreach (var entry in e.Entries)
                            {
                                entry.OriginalValues.SetValues(entry.GetDatabaseValues());
                                saved = false;
                                count++;
                            }
                        }
                        else
                        {
                            _logger.LogError(e.ToString());
                        }
                    }
                }

                return written;
            }
            catch (DbUpdateException ex)
            {
                throw new Exception($"Unable to save {typeof(T).Name}", ex.InnerException);
            }
        }
    }
}
