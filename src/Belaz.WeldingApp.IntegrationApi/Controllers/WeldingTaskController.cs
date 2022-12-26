using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.WeldingTask;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.IntegrationApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class WeldingTaskController : ControllerBase
{
    private readonly IWeldingTaskIntegrationApi _weldingTaskIntegrationApi;

    public WeldingTaskController(IWeldingTaskIntegrationApi weldingTaskIntegrationApi)
    {
        _weldingTaskIntegrationApi = weldingTaskIntegrationApi;
    }

    [HttpGet("fullNames")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<WeldingTaskFullNamesDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WeldingTaskFullNamesDto>>> GetAllWithFullNamesAsync()
    {
        return await _weldingTaskIntegrationApi.GetAllWithFullNamesAsync();
    }

    [HttpGet("registrarInfo")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<WeldingTaskRegistrarInfoDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WeldingTaskRegistrarInfoDto>>> GetAllRegistrarInfoAsync()
    {
        return await _weldingTaskIntegrationApi.GetAllRegistrarInfoAsync();
    }
}
