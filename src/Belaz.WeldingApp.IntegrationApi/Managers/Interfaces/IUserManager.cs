using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Identity;

namespace Belaz.WeldingApp.IntegrationApi.Managers.Interfaces
{
    public interface IUserManager
    {
        Task<IReadOnlyCollection<IdentityUserDto>> GetUsers();
    }
}
