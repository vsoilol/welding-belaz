using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Models;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces
{
    public interface IUserIntergrationApi
    {
        Task<IReadOnlyCollection<UserData>> GetUsers();
    }
}
