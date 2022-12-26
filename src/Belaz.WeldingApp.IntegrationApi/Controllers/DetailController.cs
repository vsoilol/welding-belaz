using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Detail;
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
public class DetailController : ControllerBase
{
    private readonly IDetailIntegrationApi _detailIntegrationApi;

    public DetailController(IDetailIntegrationApi detailIntegrationApi)
    {
        _detailIntegrationApi = detailIntegrationApi;
    }

    [HttpGet("byStatus/{status}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<DetailDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<DetailDto>>> GetAllByTaskStatusAsync([FromRoute] Status status)
    {
        return await _detailIntegrationApi.GetAllByTaskStatusAsync(status);
    }

    [HttpGet("{id}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(DetailDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<DetailDto?>> GetByIdAsync([FromRoute] Guid id)
    {
        return await _detailIntegrationApi.GetByIdAsync(id);
    }
}
