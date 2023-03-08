﻿using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IWeldingTaskRepository
{
    Task<List<WeldingTaskDto>> GetAllCompletedTaskAsync();

    Task<List<WeldingTaskDto>> GetAllAsync();

    Task<List<WeldingTaskDto>> GetAllUncompletedTaskAsync();

    Task<WeldingTaskDto> GetByIdAsync(Guid id);

    Task<WeldingTaskDto> UpdateAsync(WeldingTask entity);
}
