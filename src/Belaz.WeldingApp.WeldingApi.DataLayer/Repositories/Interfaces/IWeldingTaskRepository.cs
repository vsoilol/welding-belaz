using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IWeldingTaskRepository
{
    Task<List<WeldingTaskDto>> GetAllCompletedTaskAsync();

    Task<List<WeldingTaskDto>> GetAllAsync();

    Task<List<WeldingTaskDto>> GetAllUncompletedTaskAsync();

    Task<WeldingTaskDto> GetByIdAsync(Guid id);

    Task<WeldingTaskDto> UpdateAsync(WeldingTask entity);

    Task<WeldingTaskDto> ChangeWeldingTaskStatusAsync(Guid id, WeldingTaskStatus status);

    Task DeleteAsync(Guid id);

    Task<WeldingTaskDto> ChangeWeldingTaskDateAsync(Guid id, DateTime date);

    Task<WeldingTaskDto> ChangeWeldingTaskSeamAmountAsync(Guid id, int seamAmount);
}
