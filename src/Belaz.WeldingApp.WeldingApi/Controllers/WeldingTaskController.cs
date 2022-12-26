using Belaz.WeldingApp.WeldingApi.Contracts.Responses.WeldingTask;
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
public class WeldingTaskController : ControllerBase
{
    private readonly IWeldingTaskManager _weldingTaskManager;

    public WeldingTaskController(IWeldingTaskManager weldingTaskManager)
    {
        _weldingTaskManager = weldingTaskManager;
    }
    
    [HttpGet("fullNames")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<WeldingTaskFullNamesDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WeldingTaskFullNamesDto>>> GetAllWithFullNamesAsync()
    {
        return await _weldingTaskManager.GetAllWithFullNamesAsync();
    }
    
    [HttpGet("registrarInfo")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<WeldingTaskRegistrarInfoDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WeldingTaskRegistrarInfoDto>>> GetAllRegistrarInfoAsync()
    {
        return await _weldingTaskManager.GetAllRegistrarInfoAsync();
    }
}