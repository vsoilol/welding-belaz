using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Workplace;
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
public class WorkplaceController : ControllerBase
{
    private readonly IWorkplaceIntegrationApi _workplaceIntegrationApi;

    public WorkplaceController(IWorkplaceIntegrationApi workplaceIntegrationApi)
    {
        _workplaceIntegrationApi = workplaceIntegrationApi;
    }

    [HttpGet]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<WorkplaceDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WorkplaceDto>>> GetAllAsync()
    {
        return await _workplaceIntegrationApi.GetAllAsync();
    }

    [HttpGet("{id}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(WorkplaceDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WorkplaceDto?>> GetByIdAsync([FromRoute] Guid id)
    {
        return await _workplaceIntegrationApi.GetByIdAsync(id);
    }
}
