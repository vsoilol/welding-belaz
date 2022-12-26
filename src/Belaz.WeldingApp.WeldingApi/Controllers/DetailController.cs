using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Detail;
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
public class DetailController : ControllerBase
{
    private readonly IDetailManager _detailManager;

    public DetailController(IDetailManager detailManager)
    {
        _detailManager = detailManager;
    }
    
    [HttpGet("byStatus/{status}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<DetailDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<DetailDto>>> GetAllByTaskStatusAsync([FromRoute] Status status)
    {
        return await _detailManager.GetAllByWeldingTaskStatus(status);
    }
    
    [HttpGet("{id}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(DetailDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<DetailDto?>> GetByIdAsync([FromRoute] Guid id)
    {
        return await _detailManager.GetByIdAsync(id);
    }
}