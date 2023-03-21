using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingTask;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IWeldingTaskService
{
    Task<List<WeldingTaskDto>> GetAllCompletedTaskAsync();

    Task<List<WeldingTaskDto>> GetAllUncompletedTaskAsync();

    Task<List<WeldingTaskDto>> GetAllAsync();

    Task<Result<WeldingTaskDto>> UpdateAsync(UpdateWeldingTaskRequest request);

    Task<Result<WeldingTaskDto>> ChangeWeldingTaskStatusAsync(
        ChangeWeldingTaskStatusRequest request
    );

    Task<Result<Unit>> DeleteAsync(DeleteWeldingTaskRequest request);

    Task<Result<WeldingTaskDto>> ChangeWeldingTaskDateAsync(ChangeWeldingTaskDateRequest request);

    Task<Result<WeldingTaskDto>> ChangeWeldingTaskSeamAmountAsync(
        ChangeWeldingSeamAmountRequest request
    );
}
