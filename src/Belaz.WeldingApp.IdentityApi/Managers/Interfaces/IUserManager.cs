using Belaz.WeldingApp.IdentityApi.Contracts.Requests.User;
using Belaz.WeldingApp.IdentityApi.Contracts.Responses.User;

namespace Belaz.WeldingApp.IdentityApi.Managers.Interfaces
{
    public interface IUserManager
    {
        Task<IEnumerable<UserDto>> GetAllAsync();

        Task<UserDto> GetByIdAsync(Guid id);

        Task<UserDto> AddAsync(CreateUserRequest user);

        Task<UserDto> UpdateAsync(Guid id, CreateUserRequest user);

        Task<bool> DeleteAsync(Guid id);
    }
}
