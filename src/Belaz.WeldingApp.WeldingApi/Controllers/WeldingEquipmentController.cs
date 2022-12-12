using AutoMapper;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[Route("api/weldingEquipment")]
[ApiController]
public class WeldingEquipmentController : ControllerBase
{
    private readonly IWeldingEquipmentManager _weldingEquipmentManager;

    public WeldingEquipmentController(IWeldingEquipmentManager weldingEquipmentManager)
    {
        _weldingEquipmentManager = weldingEquipmentManager;
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<WeldingEquipmentDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WeldingEquipmentDto>>> GetAllWeldingEquipmentsAsync()
    {
        return await _weldingEquipmentManager.GetAllAsync();
    }

    [HttpGet("downtime")]
    [ProducesResponseType(typeof(IEnumerable<WeldingEquipmentDowntimeDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WeldingEquipmentDowntimeDto>>> GetAllWeldingEquipmentDowntimesAsync()
    {
        return await _weldingEquipmentManager.GetAllWeldingEquipmentDowntimesAsync();
    }
}
