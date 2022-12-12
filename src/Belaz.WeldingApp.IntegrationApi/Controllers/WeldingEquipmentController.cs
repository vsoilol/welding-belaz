using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.WeldingEquipment;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.IntegrationApi.Controllers;

[Route("api/weldingEquipment")]
[ApiController]
public class WeldingEquipmentController : ControllerBase
{
    private readonly IWeldingEquipmentIntegrationApi _weldingEquipmentIntegrationApi;

    public WeldingEquipmentController(IWeldingEquipmentIntegrationApi weldingEquipmentIntegrationApi)
    {
        _weldingEquipmentIntegrationApi = weldingEquipmentIntegrationApi;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<WeldingEquipmentDto>>> GetAllWeldingEquipmentsAsync()
    {
        return await _weldingEquipmentIntegrationApi.GetAllWeldingEquipmentsAsync();
    }

    [HttpGet("downtime")]
    public async Task<ActionResult<IEnumerable<WeldingEquipmentDowntimeDto>>> GetAllWeldingEquipmentDowntimesAsync()
    {
        return await _weldingEquipmentIntegrationApi.GetAllWeldingEquipmentDowntimesAsync();
    }
}
