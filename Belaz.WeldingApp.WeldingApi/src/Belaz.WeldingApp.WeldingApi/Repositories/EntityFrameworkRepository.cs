using System.Linq.Expressions;
using Belaz.WeldingApp.WeldingApi.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories.Models;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Repositories
{
    public abstract class EntityFrameworkRepository<T> : IRepository<T>
        where T : Entity
    {
        private readonly DbSet<T> _entities;

        private readonly ILogger<EntityFrameworkRepository<T>> _logger;

        protected EntityFrameworkRepository(DbContext context, ILogger<EntityFrameworkRepository<T>> logger)
        {
            Context = context;
            _entities = context.Set<T>();
            _logger = logger;
        }

        protected DbContext Context { get; }

        public virtual IQueryable<T> AsQueryable()
        {
            return _entities.AsQueryable();
        }

        public virtual IEnumerable<T> GetAll()
        {
            return _entities.AsEnumerable();
        }

        public IEnumerable<T> GetByFilter(Expression<Func<T, bool>> filter)
        {
            return _entities.Where(filter).AsEnumerable();
        }

        public async Task<IEnumerable<T>> GetAllAsync()
        {
            return await _entities.ToListAsync();
        }

        public async Task<IEnumerable<T>> GetByFilterAsync(Expression<Func<T, bool>> filter)
        {
            return await _entities.Where(filter).ToListAsync();
        }

        public virtual T GetById(int id)
        {
            return _entities.Find(id);
        }

        public virtual async Task<T> GetByIdAsync(int id)
        {
            return await _entities.FindAsync(id);
        }

        public virtual bool Add(T entity)
        {
            _entities.Add(entity);
            return true;
        }

        public virtual bool Update(T entity)
        {
            _entities.Update(entity);
            return true;
        }

        public virtual async Task<bool> DeleteByFilterAsync(Expression<Func<T, bool>> filter)
        {
            var toDetele = await GetByFilterAsync(filter);
            _entities.RemoveRange(toDetele);
            return true;
        }

        public virtual void Attach(T entity)
        {
            _entities.Attach(entity);
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
