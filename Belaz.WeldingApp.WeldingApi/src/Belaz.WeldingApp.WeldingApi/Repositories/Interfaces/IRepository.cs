using Belaz.WeldingApp.WeldingApi.Repositories.Models;
using System.Linq.Expressions;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Interfaces
{
    public interface IRepository<T>
         where T : Entity
    {
        bool Add(T entity);

        IQueryable<T> AsQueryable();

        void Attach(T entity);

        Task<bool> DeleteByFilterAsync(Expression<Func<T, bool>> filter);

        void Dispose();

        IEnumerable<T> GetAll();

        Task<IEnumerable<T>> GetAllAsync();

        IEnumerable<T> GetByFilter(Expression<Func<T, bool>> filter);

        Task<IEnumerable<T>> GetByFilterAsync(Expression<Func<T, bool>> filter);

        T GetById(int id);

        Task<T> GetByIdAsync(int id);

        bool Save();

        Task<bool> SaveAsync();

        bool Update(T entity);
    }
}
