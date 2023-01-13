using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Common;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Inspector;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces
{
    public interface IInspectorManager
    {
        Task<List<InspectorDto>> GetAllAsync();
        
        Task<InspectorDto?> CreateAsync(CreateUserRequest request);
    
        Task UpdateAsync(UpdateUserRequest request);
    }
}
