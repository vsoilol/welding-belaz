using Belaz.WeldingApp.RegistarApi.Domain.Dtos;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;

public interface ISeamRepository
{
    Task<SeamBriefDto> GetSeamByIdAsync(Guid id);
    
    Task<Guid> GetSeamIdByWeldingTaskIdAsync(Guid weldingTaskId);
}