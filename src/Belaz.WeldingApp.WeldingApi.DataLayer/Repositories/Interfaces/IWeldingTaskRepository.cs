using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IWeldingTaskRepository
{
    Task<List<WeldingTaskFullNamesDto>> GetAllWithFullNamesAsync();

    Task<List<WeldingTaskRegistrarInfoDto>> GetAllRegistrarInfoAsync();
    
    Task<List<WeldingTaskDto>> GetAllCompletedTaskAsync();
}