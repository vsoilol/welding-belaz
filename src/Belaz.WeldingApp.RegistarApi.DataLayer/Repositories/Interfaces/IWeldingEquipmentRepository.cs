using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;

public interface IWeldingEquipmentRepository
{
    Task<WeldingEquipmentDto> GetByRfidTagAsync(string rfidTag);
    
    Task AddWeldingEquipmentConditionTimeAsync(WeldingEquipmentConditionTime conditionTime);
}