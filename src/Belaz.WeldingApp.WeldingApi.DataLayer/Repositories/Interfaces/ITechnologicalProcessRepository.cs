﻿using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface ITechnologicalProcessRepository
{
    Task<TechnologicalProcessDto> GetByIdAsync(Guid id);

    Task<List<TechnologicalProcessDto>> GetAllAsync();

    Task<TechnologicalProcessDto> CreateAsync(TechnologicalProcess entity);

    Task<TechnologicalProcessDto> UpdateAsync(TechnologicalProcess entity);

    Task DeleteAsync(Guid id);
}
