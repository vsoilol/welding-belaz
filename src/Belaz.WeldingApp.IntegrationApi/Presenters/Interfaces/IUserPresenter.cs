using Belaz.WeldingApp.IntegrationApi.Presenters.Models;

namespace Belaz.WeldingApp.IntegrationApi.Presenters.Interfaces
{
    public interface IUserPresenter
    {
        Task<IReadOnlyCollection<UserContract>> GetUsers();
    }
}
