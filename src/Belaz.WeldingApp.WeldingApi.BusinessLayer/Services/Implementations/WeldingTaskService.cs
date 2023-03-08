using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingTask;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
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
}
