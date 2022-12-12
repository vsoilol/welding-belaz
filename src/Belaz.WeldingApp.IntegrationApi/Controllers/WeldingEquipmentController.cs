using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.WeldingEquipment;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.IntegrationApi.Controllers;

[Route("api/weldingEquipment")]
[ApiController]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class WeldingEquipmentController : ControllerBase
{
    private readonly IWeldingEquipmentIntegrationApi _weldingEquipmentIntegrationApi;

    public WeldingEquipmentController(IWeldingEquipmentIntegrationApi weldingEquipmentIntegrationApi)
    {
        _weldingEquipmentIntegrationApi = weldingEquipmentIntegrationApi;
    }

    [HttpGet]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    public async Task<ActionResult<IEnumerable<WeldingEquipmentDto>>> GetAllWeldingEquipmentsAsync()
    {
        return await _weldingEquipmentIntegrationApi.GetAllWeldingEquipmentsAsync();
    }

    [HttpGet("downtime")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    public async Task<ActionResult<IEnumerable<WeldingEquipmentDowntimeDto>>> GetAllWeldingEquipmentDowntimesAsync()
    {
        return await _weldingEquipmentIntegrationApi.GetAllWeldingEquipmentDowntimesAsync();
    }
}
