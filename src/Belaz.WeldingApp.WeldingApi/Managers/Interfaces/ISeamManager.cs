using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface ISeamManager
{
    Task<List<SeamDto>> GetAllByWeldingTaskStatus(Status status);
    
    Task<SeamDto?> GetByIdAsync(Guid id);
    
    Task<List<SeamDto>> GetAllByControlSubject(bool isControlSubject);
    
    Task<SeamDto?> CreateAsync(CreateSeamRequest request);
    
    Task<SeamDto?> UpdateAsync(UpdateSeamRequest request);
    
    Task<List<SeamDto>> GetAllByInspectorIdAsync(Guid inspectorId);
    
    Task<List<SeamDto>> GetAllByWelderIdAsync(Guid welderId);
    
    Task AssignSeamToWelderAsync(AssignSeamToWelderRequest request);
    
    Task AssignSeamToInspectorAsync(AssignSeamToInspectorRequest request);
    
    Task<List<DefectiveSeamDto>> GetAllDefectiveSeamsAsync();
    
    Task<DefectiveSeamDto?> AddDefectiveReasonToSeamAsync(AddDefectiveReasonToSeamRequest request);
}