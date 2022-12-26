using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Seam;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface ISeamManager
{
    Task<List<SeamDto>> GetAllByWeldingTaskStatus(Status status);
    
    Task<SeamDto?> GetByIdAsync(Guid id);
}