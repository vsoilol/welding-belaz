using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Extensions;
using LanguageExt;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
[AuthorizeRoles(Role.Admin, Role.Master, Role.Inspector, Role.Welder, Role.Chief)]
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
    [ProducesResponseType(
        typeof(IEnumerable<WeldingEquipmentDowntimeDto>),
        StatusCodes.Status200OK
    )]
    public async Task<
        ActionResult<IEnumerable<WeldingEquipmentDowntimeDto>>
    > GetAllWeldingEquipmentDowntimesAsync()
    {
        return await _weldingEquipmentService.GetAllWeldingEquipmentDowntimesAsync();
    }

    [HttpPost]
    [ProducesResponseType(typeof(WeldingEquipmentDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WeldingEquipmentDto>> CreateAsync(
        [FromBody] CreateEquipmentRequest request
    )
    {
        var result = await _weldingEquipmentService.CreateAsync(request);
        return result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(WeldingEquipmentDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WeldingEquipmentDto>> UpdateAsync(
        [FromBody] UpdateEquipmentRequest request
    )
    {
        var result = await _weldingEquipmentService.UpdateAsync(request);
        return result.ToOk();
    }

    [HttpPost("downtime")]
    [ProducesResponseType(typeof(WeldingEquipmentDowntimeDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WeldingEquipmentDowntimeDto>> AddWeldingEquipmentDowntimeAsync(
        [FromBody] CreateWeldingEquipmentDowntimeRequest request
    )
    {
        var result = await _weldingEquipmentService.AddWeldingEquipmentDowntimeAsync(request);
        return result.ToOk();
    }

    [HttpPut("downtime")]
    [ProducesResponseType(typeof(WeldingEquipmentDowntimeDto), StatusCodes.Status200OK)]
    public async Task<
        ActionResult<WeldingEquipmentDowntimeDto>
    > UpdateWeldingEquipmentDowntimeAsync([FromBody] UpdateWeldingEquipmentDowntimeRequest request)
    {
        var result = await _weldingEquipmentService.UpdateWeldingEquipmentDowntimeAsync(request);
        return result.ToOk();
    }

    [HttpPut("assignMaster")]
    public async Task<ActionResult<Unit>> AssignEquipmentsToMasterAsync(
        [FromBody] AssignEquipmentsToMastersRequest request
    )
    {
        var result = await _weldingEquipmentService.AssignEquipmentsToMasterAsync(request);
        return result.ToOk();
    }

    [HttpPut("assignWelders")]
    public async Task<ActionResult<Unit>> AssignEquipmentToWeldersAsync(
        [FromBody] AssignEquipmentsToWeldersRequest request
    )
    {
        var result = await _weldingEquipmentService.AssignEquipmentsToWeldersAsync(request);
        return result.ToOk();
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<Unit>> DeleteAsync([FromRoute] Guid id)
    {
        var result = await _weldingEquipmentService.DeleteAsync(
            new DeleteWeldingEquipmentRequest { Id = id }
        );
        return result.ToOk();
    }
}
