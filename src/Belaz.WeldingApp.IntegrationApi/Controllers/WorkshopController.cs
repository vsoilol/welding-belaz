using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Workshop;
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
public class WorkshopController : ControllerBase
{
    private readonly IWorkshopIntegrationApi _workshopIntegrationApi;

    public WorkshopController(IWorkshopIntegrationApi workshopIntegrationApi)
    {
        _workshopIntegrationApi = workshopIntegrationApi;
    }

    [HttpGet]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<WorkshopDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WorkshopDto>>> GetAllAsync()
    {
        return await _workshopIntegrationApi.GetAllAsync();
    }

    [HttpGet("{id}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(WorkshopDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WorkshopDto?>> GetByIdAsync([FromRoute] Guid id)
    {
        return await _workshopIntegrationApi.GetByIdAsync(id);
    }
}
