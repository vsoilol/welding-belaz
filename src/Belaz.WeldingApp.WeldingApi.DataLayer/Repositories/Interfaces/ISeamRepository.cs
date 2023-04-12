using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Seam;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface ISeamRepository
{
    Task<List<SeamDto>> GetAllAsync();

    Task<List<SeamDto>> GetAllByControlSubjectAsync(bool isControlSubject);

    Task<SeamDto> GetByIdAsync(Guid id);

    Task<SeamDto> CreateAsync(Seam entity);

    Task<SeamDto> UpdateAsync(Seam entity);

    Task<List<SeamDto>> GetAllByInspectorIdAsync(Guid inspectorId);

    Task AssignSeamToInspectorAsync(Guid seamId, Guid inspectorId);

    Task AssignSeamsToInspectorAsync(List<Guid> seamIds, Guid inspectorId);

    Task<List<DefectiveSeamDto>> GetAllDefectiveSeamsAsync();

    Task<DefectiveSeamDto> GetDefectiveReasonByIdAsync(Guid id);

    Task<DefectiveSeamDto> AddDefectiveReasonToSeamAsync(DefectiveReason entity);

    Task<DefectiveSeamDto> UpdateDefectiveReasonSeamAsync(DefectiveReason entity);

    Task DeleteAsync(Guid id);
}
