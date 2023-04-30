﻿using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Master;
using Belaz.WeldingApp.Common.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IMasterRepository
{
    Task<List<MasterDto>> GetAllAsync();

    Task<MasterDto> GetByIdAsync(Guid id);
    
    Task<UserFullNameDto> GetUserFullNameByIdAsync(Guid id);

    Task<MasterDto> CreateAsync(Master entity);

    Task<MasterDto> UpdateAsync(Master entity);

    Task DeleteAsync(Guid id);
}
