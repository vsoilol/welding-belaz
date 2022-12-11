using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Models;

namespace Belaz.WeldingApp.IntegrationApi.Managers.Interfaces
{
    public interface IUserManager
    {
        Task<IReadOnlyCollection<UserData>> GetUsers();
    }
}
