using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Detail;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IDetailManager
{
    Task<List<DetailDto>> GetAllByWeldingTaskStatus(Status status);
    
    Task<DetailDto?> GetByIdAsync(Guid id);
}