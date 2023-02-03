using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class WeldingTaskService : IWeldingTaskService
{
    private readonly IWeldingTaskRepository _weldingTaskRepository;

    public WeldingTaskService(IWeldingTaskRepository weldingTaskRepository)
    {
        _weldingTaskRepository = weldingTaskRepository;
    }

    public Task<List<WeldingTaskFullNamesDto>> GetAllWithFullNamesAsync()
    {
        return _weldingTaskRepository.GetAllWithFullNamesAsync();
    }

    public Task<List<WeldingTaskRegistrarInfoDto>> GetAllRegistrarInfoAsync()
    {
        return _weldingTaskRepository.GetAllRegistrarInfoAsync();
    }

    public Task<List<WeldingTaskDto>> GetAllCompletedTaskAsync()
    {
        return _weldingTaskRepository.GetAllCompletedTaskAsync();
    }
}