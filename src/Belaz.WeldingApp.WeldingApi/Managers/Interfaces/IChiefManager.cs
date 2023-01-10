using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Chief;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces
{
    public interface IChiefManager
    {
        Task<List<ChiefDto>> GetAllAsync();
    }
}
