using Belaz.WeldingApp.WeldingApi.Contracts.Responses.WeldingEquipment;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IWeldingEquipmentManager
{
    Task<List<WeldingEquipmentDto>> GetAllAsync();

    Task<List<WeldingEquipmentDowntimeDto>> GetAllWeldingEquipmentDowntimesAsync();
}
