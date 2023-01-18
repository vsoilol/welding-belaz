using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Welder;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Welder;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IWelderManager
{
    Task<List<WelderDto>> GetAllAsync();
    
    Task<WelderDto?> CreateAsync(CreateWelderRequest request);
    
    Task<WelderDto?> UpdateAsync(UpdateWelderRequest request);
}
