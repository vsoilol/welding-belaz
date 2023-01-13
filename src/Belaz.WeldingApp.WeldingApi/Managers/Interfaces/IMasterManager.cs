using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Common;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Master;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces
{
    public interface IMasterManager
    {
        Task<List<MasterDto>> GetAllAsync();
        
        Task<MasterDto?> CreateAsync(CreateUserWithEquipmentRequest request);
    
        Task UpdateAsync(UpdateUserWithEquipmentRequest request);
    }
}
