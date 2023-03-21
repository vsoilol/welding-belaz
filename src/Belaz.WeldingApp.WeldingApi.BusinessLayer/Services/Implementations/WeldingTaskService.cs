using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingTask;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class WeldingTaskService : IWeldingTaskService
{
    private readonly IWeldingTaskRepository _weldingTaskRepository;
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;

    public WeldingTaskService(
        IWeldingTaskRepository weldingTaskRepository,
        IValidationService validationService,
        IMapper mapper
    )
    {
        _weldingTaskRepository = weldingTaskRepository;
        _validationService = validationService;
        _mapper = mapper;
    }

    public Task<List<WeldingTaskDto>> GetAllCompletedTaskAsync()
    {
        return _weldingTaskRepository.GetAllCompletedTaskAsync();
    }

    public Task<List<WeldingTaskDto>> GetAllAsync()
    {
        return _weldingTaskRepository.GetAllAsync();
    }

    public async Task<Result<WeldingTaskDto>> UpdateAsync(UpdateWeldingTaskRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var weldingTask = _mapper.Map<WeldingTask>(request);

            return _weldingTaskRepository.UpdateAsync(weldingTask);
        });
    }

    public Task<List<WeldingTaskDto>> GetAllUncompletedTaskAsync()
    {
        return _weldingTaskRepository.GetAllUncompletedTaskAsync();
    }

    public async Task<Result<WeldingTaskDto>> ChangeWeldingTaskStatusAsync(
        ChangeWeldingTaskStatusRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(
            () => _weldingTaskRepository.ChangeWeldingTaskStatusAsync(request.Id, request.Status)
        );
    }

    public async Task<Result<Unit>> DeleteAsync(DeleteWeldingTaskRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            await _weldingTaskRepository.DeleteAsync(request.Id);
            return Unit.Default;
        });
    }

    public async Task<Result<WeldingTaskDto>> ChangeWeldingTaskDateAsync(
        ChangeWeldingTaskDateRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var date = request.Date.ToDateTime();

            return _weldingTaskRepository.ChangeWeldingTaskDateAsync(request.Id, date);
        });
    }

    public async Task<Result<WeldingTaskDto>> ChangeWeldingTaskSeamAmountAsync(
        ChangeWeldingSeamAmountRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(
            () =>
                _weldingTaskRepository.ChangeWeldingTaskSeamAmountAsync(
                    request.Id,
                    request.SeamAmount
                )
        );
    }
}
