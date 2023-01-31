using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Extensions;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class WeldingEquipmentController : ControllerBase
{
    private readonly IWeldingEquipmentService _weldingEquipmentService;

    public WeldingEquipmentController(IWeldingEquipmentService weldingEquipmentService)
    {
        _weldingEquipmentService = weldingEquipmentService;
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<WeldingEquipmentDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WeldingEquipmentDto>>> GetAllWeldingEquipmentsAsync()
    {
        return await _weldingEquipmentService.GetAllAsync();
    }

    [HttpGet("downtime")]
    [ProducesResponseType(typeof(IEnumerable<WeldingEquipmentDowntimeDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WeldingEquipmentDowntimeDto>>> GetAllWeldingEquipmentDowntimesAsync()
    {
        return await _weldingEquipmentService.GetAllWeldingEquipmentDowntimesAsync();
    }

    [HttpPost]
    [ProducesResponseType(typeof(WeldingEquipmentDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WeldingEquipmentDto>> CreateAsync([FromBody] CreateEquipmentRequest request)
    {
        var result = await _weldingEquipmentService.CreateAsync(request);
        return result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(WeldingEquipmentDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WeldingEquipmentDto>> UpdateAsync([FromBody] UpdateEquipmentRequest request)
    {
        var result = await _weldingEquipmentService.UpdateAsync(request);
        return result.ToOk();
    }

    [HttpPost("downtime")]
    [ProducesResponseType(typeof(WeldingEquipmentDowntimeDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WeldingEquipmentDowntimeDto>> AddWeldingEquipmentDowntimeAsync(
        [FromBody] CreateWeldingEquipmentDowntimeRequest request)
    {
        var result = await _weldingEquipmentService.AddWeldingEquipmentDowntimeAsync(request);
        return result.ToOk();
    }

    [HttpPut("downtime")]
    [ProducesResponseType(typeof(WeldingEquipmentDowntimeDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WeldingEquipmentDowntimeDto>> UpdateWeldingEquipmentDowntimeAsync(
        [FromBody] UpdateWeldingEquipmentDowntimeRequest request)
    {
        var result = await _weldingEquipmentService.UpdateWeldingEquipmentDowntimeAsync(request);
        return result.ToOk();
    }
}