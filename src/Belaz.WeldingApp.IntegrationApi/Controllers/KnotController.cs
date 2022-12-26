using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Knot;
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
public class KnotController : ControllerBase
{
    private readonly IKnotIntegrationApi _knotIntegrationApi;

    public KnotController(IKnotIntegrationApi knotIntegrationApi)
    {
        _knotIntegrationApi = knotIntegrationApi;
    }

    [HttpGet("byStatus/{status}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<KnotDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<KnotDto>>> GetAllByTaskStatusAsync([FromRoute] Status status)
    {
        return await _knotIntegrationApi.GetAllByTaskStatusAsync(status);
    }

    [HttpGet("{id}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(KnotDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<KnotDto?>> GetByIdAsync([FromRoute] Guid id)
    {
        return await _knotIntegrationApi.GetByIdAsync(id);
    }
}
