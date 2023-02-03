using System.Net;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;
using BadRequestResult = WeldingApp.Common.Models.BadRequestResult;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
[AuthorizeRoles(Role.Admin, Role.Master, Role.Inspector, Role.Welder, Role.Chief)]
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
    public Task<ActionResult<IEnumerable<WeldingTaskRegistrarInfoDto>>> GetAllRegistrarInfoAsync()
    {
        var badRequestResult = new BadRequestResult
        {
            Errors = "Method not implement",
            StatusCode = (int)HttpStatusCode.NotImplemented,
            Title = "Not implement Error"
        };

        return Task
            .FromResult<ActionResult<IEnumerable<WeldingTaskRegistrarInfoDto>>>(BadRequest(badRequestResult));
    }
    
    [HttpGet("completed")]
    [ProducesResponseType(typeof(IEnumerable<WeldingTaskDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WeldingTaskDto>>> GetAllCompletedTaskAsync()
    {
        return await _weldingTaskService.GetAllCompletedTaskAsync();
    }
}