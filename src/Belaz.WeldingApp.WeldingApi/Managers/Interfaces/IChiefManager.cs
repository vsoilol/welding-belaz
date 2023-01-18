using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Common;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Chief;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Master;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces
{
    public interface IChiefManager
    {
        Task<List<ChiefDto>> GetAllAsync();
        
        Task<ChiefDto?> CreateAsync(CreateUserWithEquipmentRequest request);
    
        Task<ChiefDto?> UpdateAsync(UpdateUserWithEquipmentRequest request);
    }
}
