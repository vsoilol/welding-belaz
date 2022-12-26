using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Knot;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Post;
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
public class KnotController : ControllerBase
{
    private readonly IKnotManager _knotManager;

    public KnotController(IKnotManager knotManager)
    {
        _knotManager = knotManager;
    }
    
    [HttpGet("byStatus/{status}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<KnotDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<KnotDto>>> GetAllByTaskStatusAsync([FromRoute] Status status)
    {
        return await _knotManager.GetAllByWeldingTaskStatus(status);
    }
    
    [HttpGet("{id}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(KnotDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<KnotDto?>> GetByIdAsync([FromRoute] Guid id)
    {
        return await _knotManager.GetByIdAsync(id);
    }
}