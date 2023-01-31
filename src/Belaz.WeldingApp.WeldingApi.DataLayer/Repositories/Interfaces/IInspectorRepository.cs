﻿using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IInspectorRepository
{
    Task<List<InspectorDto>> GetAllAsync();

    Task<InspectorDto> GetByIdAsync(Guid id);

    Task<InspectorDto> CreateAsync(Inspector entity);

    Task<InspectorDto> UpdateAsync(Inspector entity);
}