using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingTask;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IWeldingTaskService
{
    Task<List<WeldingTaskFullNamesDto>> GetAllWithFullNamesAsync();

    Task<List<WeldingTaskRegistrarInfoDto>> GetAllRegistrarInfoAsync();

    Task<List<WeldingTaskDto>> GetAllCompletedTaskAsync();
    
    Task<List<WeldingTaskDto>> GetAllAsync();
    
    Task<Result<WeldingTaskDto>> CreateAsync(CreateWeldingTaskRequest request);
    
    Task<Result<WeldingTaskDto>> UpdateAsync(UpdateWeldingTaskRequest request);
}