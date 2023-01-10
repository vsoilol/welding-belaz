using System.Linq.Expressions;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities;
using Belaz.WeldingApp.WeldingApi.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Repositories
{
    public abstract class EntityFrameworkRepository<T> : IRepository<T>
        where T : Entity
    {
        private readonly ILogger<EntityFrameworkRepository<T>> _logger;

        protected EntityFrameworkRepository(ApplicationContext context, ILogger<EntityFrameworkRepository<T>> logger)
        {
            Context = context;
            Entities = context.Set<T>();
            _logger = logger;
        }

        protected ApplicationContext Context { get; }

        protected readonly DbSet<T> Entities;

        public virtual IQueryable<T> AsQueryable()
        {
            return Entities.AsQueryable();
        }

        public virtual IEnumerable<T> GetAll()
        {
            return Entities.AsEnumerable();
        }

        public IEnumerable<T> GetByFilter(Expression<Func<T, bool>> filter)
        {
            return Entities.Where(filter).AsEnumerable();
        }

        public virtual async Task<IEnumerable<T>> GetAllAsync()
        {
            return await Entities.ToListAsync();
        }

        public async Task<IEnumerable<T>> GetByFilterAsync(Expression<Func<T, bool>> filter)
        {
            return await Entities.Where(filter).ToListAsync();
        }

        public IQueryable<T> AsQueryableByFilter(Expression<Func<T, bool>> filter)
        {
            return Entities.Where(filter);
        }

        public virtual T GetById(Guid id)
        {
            return Entities.Find(id);
        }

        public virtual async Task<T> GetByIdAsync(Guid id)
        {
            return await Entities.FindAsync(id);
        }

        public virtual T Add(T entity)
        {
            return Entities.Add(entity).Entity;
        }

        public virtual bool Update(T entity)
        {
            Entities.Update(entity);
            return true;
        }

        public virtual async Task<bool> DeleteByFilterAsync(Expression<Func<T, bool>> filter)
        {
            var toDetele = await GetByFilterAsync(filter);
            Entities.RemoveRange(toDetele);
            return true;
        }

        public virtual void Attach(T entity)
        {
            Entities.Attach(entity);
        }

        public virtual bool Save()
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
                        written = Context.SaveChanges() > 0;
                        saved = true;
                    }
                    catch (DbUpdateConcurrencyException ex)
                    {
                        if (count < reTryMax)
                        {
                            _logger.LogWarning("Optimistic concurrency error, retrying!");
                        }
                        else
                        {
                            _logger.LogError(ex.ToString());
                        }

                        foreach (var entry in ex.Entries)
                        {
                            entry.OriginalValues.SetValues(entry.GetDatabaseValues());
                            saved = false;
                            count++;
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

        public virtual async Task<bool> SaveAsync()
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

        public virtual void Dispose()
        {
            Context?.Dispose();
        }
    }
}
