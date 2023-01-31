using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
[AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
public class WeldingTaskController : ControllerBase
{
    private readonly IWeldingTaskService _weldingTaskService;

    public WeldingTaskController(IWeldingTaskService weldingTaskService)
    {
        _weldingTaskService = weldingTaskService;
    }

    [HttpGet("fullNames")]
    [ProducesResponseType(typeof(IEnumerable<WeldingTaskFullNamesDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WeldingTaskFullNamesDto>>> GetAllWithFullNamesAsync()
    {
        return await _weldingTaskService.GetAllWithFullNamesAsync();
    }

    [HttpGet("registrarInfo")]
    [ProducesResponseType(typeof(IEnumerable<WeldingTaskRegistrarInfoDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WeldingTaskRegistrarInfoDto>>> GetAllRegistrarInfoAsync()
    {
        return await _weldingTaskService.GetAllRegistrarInfoAsync();
    }
}