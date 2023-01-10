using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Seam;
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
public class SeamController : ControllerBase
{
    private readonly ISeamManager _seamManager;

    public SeamController(ISeamManager seamManager)
    {
        _seamManager = seamManager;
    }
    
    [HttpGet("byStatus/{status}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<SeamDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<SeamDto>>> GetAllByTaskStatusAsync([FromRoute] Status status)
    {
        return await _seamManager.GetAllByWeldingTaskStatus(status);
    }
    
    [HttpGet("{id}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(SeamDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<SeamDto?>> GetByIdAsync([FromRoute] Guid id)
    {
        return await _seamManager.GetByIdAsync(id);
    }
    
    [HttpGet("byControlSubject/{isControlSubject}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<SeamDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<SeamDto>>> GetAllByControlSubjectAsync([FromRoute] bool isControlSubject)
    {
        return await _seamManager.GetAllByControlSubject(isControlSubject);
    }
    
    [HttpPost]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    public async Task<IActionResult> CreateAsync([FromBody] CreateSeamRequest request)
    {
        await _seamManager.CreateAsync(request);
        return Ok();
    }
    
    [HttpPut]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    public async Task<IActionResult> UpdateAsync([FromBody] UpdateSeamRequest request)
    {
        await _seamManager.UpdateAsync(request);
        return Ok();
    }
}