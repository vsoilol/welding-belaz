using Belaz.WeldingApp.IntegrationApi.Contracts.Responses;
using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Identity;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces
{
    public interface IUserIntegrationApi
    {
        Task<IReadOnlyCollection<IdentityUserDto>> GetUsers();
    }
}
