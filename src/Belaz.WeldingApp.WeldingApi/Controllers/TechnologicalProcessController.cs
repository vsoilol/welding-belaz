using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
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
public class TechnologicalProcessController : ControllerBase
{
    private readonly ITechnologicalProcessManager _technologicalProcessManager;

    public TechnologicalProcessController(ITechnologicalProcessManager technologicalProcessManager)
    {
        _technologicalProcessManager = technologicalProcessManager;
    }

    [HttpGet("{id}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(TechnologicalProcessDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<TechnologicalProcessDto?>> GetByIdAsync([FromRoute] Guid id)
    {
        return await _technologicalProcessManager.GetByIdAsync(id);
    }
    
    [HttpGet]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<TechnologicalProcessDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<TechnologicalProcessDto>>> GetAllAsync()
    {
        return await _technologicalProcessManager.GetAllAsync();
    }
}