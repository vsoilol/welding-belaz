using Belaz.WeldingApp.WeldingApi.Contracts.Requests.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.WeldingEquipment;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IWeldingEquipmentManager
{
    Task<List<WeldingEquipmentDto>> GetAllAsync();

    Task<List<WeldingEquipmentDowntimeDto>> GetAllWeldingEquipmentDowntimesAsync();
    
        
    Task<WeldingEquipmentDto?> CreateAsync(CreateEquipmentRequest request);
    
    Task<WeldingEquipmentDto?> UpdateAsync(UpdateEquipmentRequest request);
}
