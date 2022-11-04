using Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Models;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Interfaces
{
    public interface IUserPresenter
    {
        Task<IEnumerable<UserContract>> GetAllAsync();

        Task<UserContract> GetByIdAsync(int id);

        Task<UserContract> AddAsync(UserContract user);

        Task<UserContract> UpdateAsync(int id, UserContract user);

        Task<bool> DeleteAsync(int id);
    }
}
