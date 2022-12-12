using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.WeldingEquipment;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;

public interface IWeldingEquipmentIntegrationApi
{
    Task<List<WeldingEquipmentDto>> GetAllWeldingEquipmentsAsync();

    Task<List<WeldingEquipmentDowntimeDto>> GetAllWeldingEquipmentDowntimesAsync();
}
