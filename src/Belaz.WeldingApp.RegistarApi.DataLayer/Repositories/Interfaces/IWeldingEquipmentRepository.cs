﻿using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;

public interface IWeldingEquipmentRepository
{
    Task<WeldingEquipmentDto> GetByRfidTagAsync(string rfidTag);
    
    Task<WeldingEquipmentDto> GetByIdAsync(Guid id);

    Task AddWeldingEquipmentConditionTimeAsync(WeldingEquipmentConditionTime conditionTime);

    Task<WeldingEquipmentConditionTimeDto?> GetLastConditionTimeAsync(Guid weldingEquipmentId);

    Task UpdateEquipmentConditionTimeAsync(Guid id, double time);
    
    Task UpdateEquipmentConditionTimeAsync(Guid id, Condition condition, double time);
}
