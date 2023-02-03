using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IWeldingTaskService
{
    Task<List<WeldingTaskFullNamesDto>> GetAllWithFullNamesAsync();

    Task<List<WeldingTaskRegistrarInfoDto>> GetAllRegistrarInfoAsync();

    Task<List<WeldingTaskDto>> GetAllCompletedTaskAsync();
}