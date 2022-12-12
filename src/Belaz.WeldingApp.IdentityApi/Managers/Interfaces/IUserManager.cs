using Belaz.WeldingApp.IdentityApi.Managers.Models;

namespace Belaz.WeldingApp.IdentityApi.Managers.Interfaces
{
    public interface IUserManager
    {
        Task<IEnumerable<User>> GetAllAsync();

        IQueryable<User> AsQueryable();

        Task<User> GetByIdAsync(Guid id);

        Task<User> AddAsync(User user);

        Task<User> UpdateAsync(Guid id, User user);

        Task<bool> DeleteAsync(Guid id);
    }
}
