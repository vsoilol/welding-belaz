using System.Net;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Workplace;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Workplace;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
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
public class WorkplaceController : ControllerBase
{
    private readonly IWorkplaceManager _workplaceManager;

    public WorkplaceController(IWorkplaceManager workplaceManager)
    {
        _workplaceManager = workplaceManager;
    }
    
    [HttpGet]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<WorkplaceDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WorkplaceDto>>> GetAllAsync()
    {
        return await _workplaceManager.GetAllAsync();
    }
    
    [HttpGet("{id}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(WorkplaceDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WorkplaceDto?>> GetByIdAsync([FromRoute] Guid id)
    {
        return await _workplaceManager.GetByIdAsync(id);
    }
    
    [HttpPost]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(WorkplaceDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WorkplaceDto?>> CreateAsync([FromBody] CreateWorkplaceRequest request)
    {
        return await _workplaceManager.CreateAsync(request);
    }
    
    [HttpPut]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(WorkplaceDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WorkplaceDto?>> UpdateAsync([FromBody] UpdateWorkplaceRequest request)
    {
        var result = await _workplaceManager.UpdateAsync(request);
        return result;
    }
}