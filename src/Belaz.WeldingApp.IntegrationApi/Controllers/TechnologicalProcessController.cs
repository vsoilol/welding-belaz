using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.TechnologicalProcess;
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
public class TechnologicalProcessController : ControllerBase
{
    private readonly ITechnologicalProcessIntegrationApi _technologicalProcessIntegrationApi;

    public TechnologicalProcessController(ITechnologicalProcessIntegrationApi technologicalProcessIntegrationApi)
    {
        _technologicalProcessIntegrationApi = technologicalProcessIntegrationApi;
    }

    [HttpGet("{id}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(TechnologicalProcessDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<TechnologicalProcessDto?>> GetByIdAsync([FromRoute] Guid id)
    {
        return await _technologicalProcessIntegrationApi.GetByIdAsync(id);
    }
}
