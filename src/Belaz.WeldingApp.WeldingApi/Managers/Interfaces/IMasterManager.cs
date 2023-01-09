using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Master;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces
{
    public interface IMasterManager
    {
        Task<List<MasterDto>> GetAllAsync();
    }
}
