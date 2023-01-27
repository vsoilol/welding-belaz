﻿using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IWeldingEquipmentRepository
{
    Task<List<WeldingEquipmentDto>> GetAllAsync();
    
    Task<WeldingEquipmentDto> GetByIdAsync(Guid id);
    
    Task<WeldingEquipmentDowntimeDto> GetConditionByIdAsync(Guid id);

    Task<List<WeldingEquipmentDowntimeDto>> GetAllWeldingEquipmentDowntimesAsync();

    Task<WeldingEquipmentDto> CreateAsync(WeldingEquipment entity);

    Task<WeldingEquipmentDto> UpdateAsync(WeldingEquipment entity);

    Task<WeldingEquipmentDowntimeDto> AddWeldingEquipmentDowntimeAsync(WeldingEquipmentConditionTime entity);

    Task<WeldingEquipmentDowntimeDto> UpdateWeldingEquipmentDowntimeAsync(WeldingEquipmentConditionTime entity);
}