using Belaz.WeldingApp.IdentityApi.Presenters.Models;

namespace Belaz.WeldingApp.IdentityApi.Presenters.Interfaces
{
    public interface IUserPresenter
    {
        Task<IEnumerable<UserContract>> GetAllAsync();

        Task<UserContract> GetByIdAsync(Guid id);

        Task<UserContract> AddAsync(UserContract user);

        Task<UserContract> UpdateAsync(Guid id, UserContract user);

        Task<bool> DeleteAsync(Guid id);
    }
}
