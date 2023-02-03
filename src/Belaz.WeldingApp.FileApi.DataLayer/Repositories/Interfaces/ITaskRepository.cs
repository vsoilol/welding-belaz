﻿using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;

public interface ITaskRepository
{
    Task<TaskDto> GetByIdAsync(Guid id);
}