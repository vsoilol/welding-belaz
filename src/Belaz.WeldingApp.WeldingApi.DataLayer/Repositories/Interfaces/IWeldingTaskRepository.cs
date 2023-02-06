using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IWeldingTaskRepository
{
    Task<List<WeldingTaskFullNamesDto>> GetAllWithFullNamesAsync();

    Task<List<WeldingTaskRegistrarInfoDto>> GetAllRegistrarInfoAsync();
    
    Task<List<WeldingTaskDto>> GetAllCompletedTaskAsync();
    
    Task<List<WeldingTaskDto>> GetAllAsync();
    
    Task<WeldingTaskDto> GetByIdAsync(Guid id);
    
    Task<WeldingTaskDto> CreateAsync(WeldingTask entity);
    
    Task<WeldingTaskDto> UpdateAsync(WeldingTask entity);
}