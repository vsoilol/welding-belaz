using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Knot;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IKnotManager
{
    Task<List<KnotDto>> GetAllByWeldingTaskStatus(Status status);
    
    Task<KnotDto?> GetByIdAsync(Guid id);
}