using Belaz.WeldingApp.IntegrationApi.Contracts.Requests.User;
using Belaz.WeldingApp.IntegrationApi.Contracts.Responses;
using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Identity;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces
{
    public interface IUserIntegrationApi
    {
        Task<List<IdentityUserDto>> GetUsers();

        Task<IdentityUserDto> GetByIdAsync(Guid id);

        Task<IdentityUserDto> AddAsync(CreateUserRequest user);

        Task<IdentityUserDto> UpdateAsync(Guid id, CreateUserRequest user);

        Task<Guid> DeleteAsync(Guid id);
    }
}
