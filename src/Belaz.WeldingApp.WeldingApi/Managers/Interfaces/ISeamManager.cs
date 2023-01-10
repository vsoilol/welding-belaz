using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface ISeamManager
{
    Task<List<SeamDto>> GetAllByWeldingTaskStatus(Status status);
    
    Task<SeamDto?> GetByIdAsync(Guid id);
    
    Task<List<SeamDto>> GetAllByControlSubject(bool isControlSubject);
    
    Task CreateAsync(CreateSeamRequest request);
    
    Task UpdateAsync(UpdateSeamRequest request);
}