using Belaz.WeldingApp.WeldingApi.Contracts.Responses.WeldingTask;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IWeldingTaskManager
{
    Task<List<WeldingTaskFullNamesDto>> GetAllWithFullNamesAsync();
    
    Task<List<WeldingTaskRegistrarInfoDto>> GetAllRegistrarInfoAsync();
}