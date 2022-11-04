using Belaz.WeldingApp.IdentityApi.WebApi.Managers.Models;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Managers.Interfaces
{
    public interface IUserManager
    {
        Task<IEnumerable<User>> GetAllAsync();

        IQueryable<User> AsQueryable();

        Task<User> GetByIdAsync(int id);

        Task<User> AddAsync(User user);

        Task<User> UpdateAsync(int id, User user);

        Task<bool> DeleteAsync(int id);
    }
}
