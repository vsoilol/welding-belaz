using Belaz.WeldingApp.WeldingApi.Contracts.Responses;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IDowntimeReasonManager
{
    Task<List<DowntimeReasonDto>> GetAllAsync();
}