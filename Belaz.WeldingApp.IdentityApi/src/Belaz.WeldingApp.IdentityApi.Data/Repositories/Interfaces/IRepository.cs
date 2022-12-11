using System.Linq.Expressions;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;

namespace Belaz.WeldingApp.IdentityApi.Data.Repositories.Interfaces
{
    public interface IRepository<T>
         where T : Entity
    {
        Task<IEnumerable<T>> GetAllAsync();

        Task<T> GetByIdAsync(int id);

        Task<IEnumerable<T>> GetByFilterAsync(Expression<Func<T, bool>> filter);

        bool Update(T entity);

        Task<T> AddAsync(T entity);

        Task<bool> DeleteByIdAsync(int id);

        IQueryable<T> AsQueryable();

        Task<bool> SaveAsync();
    }
}
