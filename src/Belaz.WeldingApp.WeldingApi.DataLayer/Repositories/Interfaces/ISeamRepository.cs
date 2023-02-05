using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface ISeamRepository
{
    Task<List<SeamDto>> GetAllAsync();
    
    Task<List<SeamDto>> GetAllByStatusAsync(ProductStatus status);
    
    Task<List<SeamDto>> GetAllByControlSubjectAsync(bool isControlSubject);
    
    Task<SeamDto> GetByIdAsync(Guid id);

    Task<SeamDto> CreateAsync(Seam entity);
    
    Task<SeamDto> UpdateAsync(Seam entity);
    
    Task<List<SeamDto>> GetAllByInspectorIdAsync(Guid inspectorId);
    
    Task<List<SeamDto>> GetAllByWelderIdAsync(Guid welderId);
    
    Task AssignSeamToWelderAsync(Guid seamId, Guid welderId);
    
    Task AssignSeamsToWelderAsync(List<Guid> seamIds, Guid welderId);
    
    Task AssignSeamToInspectorAsync(Guid seamId, Guid inspectorId);
    
    Task AssignSeamsToInspectorAsync(List<Guid> seamIds, Guid inspectorId);
    
    Task<List<DefectiveSeamDto>> GetAllDefectiveSeamsAsync();
    
    Task<DefectiveSeamDto> GetDefectiveReasonByIdAsync(Guid id);
    
    Task<DefectiveSeamDto> AddDefectiveReasonToSeamAsync(StatusReason entity);
    
    Task<DefectiveSeamDto> UpdateDefectiveReasonSeamAsync(StatusReason entity);
    
    Task<SeamDto> ChangeStatusAsync(Guid id, ProductStatus status, bool isAddManually);
}