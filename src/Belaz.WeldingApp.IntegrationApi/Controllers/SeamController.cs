using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Seam;
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
public class SeamController : ControllerBase
{
    private readonly ISeamIntegrationApi _seamIntegrationApi;

    public SeamController(ISeamIntegrationApi seamIntegrationApi)
    {
        _seamIntegrationApi = seamIntegrationApi;
    }

    [HttpGet("byStatus/{status}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<SeamDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<SeamDto>>> GetAllByTaskStatusAsync([FromRoute] Status status)
    {
        return await _seamIntegrationApi.GetAllByTaskStatusAsync(status);
    }

    [HttpGet("{id}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(SeamDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<SeamDto?>> GetByIdAsync([FromRoute] Guid id)
    {
        return await _seamIntegrationApi.GetByIdAsync(id);
    }
}
