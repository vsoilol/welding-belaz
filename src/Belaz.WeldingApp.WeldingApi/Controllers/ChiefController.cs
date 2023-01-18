using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Common;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Chief;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class ChiefController : ControllerBase
{
    private readonly IChiefManager _chiefManager;

    public ChiefController(IChiefManager chiefManager)
    {
        _chiefManager = chiefManager;
    }

    [HttpGet]
    [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<ChiefDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<ChiefDto>>> GetAllWeldersAsync()
    {
        return await _chiefManager.GetAllAsync();
    }
    
    [HttpPost]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(ChiefDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ChiefDto?>> CreateAsync([FromBody] CreateUserWithEquipmentRequest request)
    {
        return await _chiefManager.CreateAsync(request);
    }
    
    [HttpPut]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(ChiefDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ChiefDto?>> UpdateAsync([FromBody] UpdateUserWithEquipmentRequest request)
    {
        return await _chiefManager.UpdateAsync(request);
    }
}