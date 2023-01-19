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
    [ProducesResponseType(typeof(SeamDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<SeamDto?>> CreateAsync([FromBody] CreateSeamRequest request)
    {
        var seam = await _seamManager.CreateAsync(request);
        return seam;
    }
    
    [HttpPut]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(SeamDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<SeamDto?>> UpdateAsync([FromBody] UpdateSeamRequest request)
    {
        return await _seamManager.UpdateAsync(request);
    }
    
    [HttpGet("byInspector/{inspectorId}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<SeamDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<SeamDto>>> GetAllByInspectorIdAsync([FromRoute] Guid inspectorId)
    {
        return await _seamManager.GetAllByInspectorIdAsync(inspectorId);
    }
    
    [HttpGet("byWelder/{welderId}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<SeamDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<SeamDto>>> GetAllByWelderIdAsync([FromRoute] Guid welderId)
    {
        return await _seamManager.GetAllByWelderIdAsync(welderId);
    }
    
    [HttpPut("assignWelder")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    public async Task<ActionResult> AssignSeamToWelderAsync([FromBody] AssignSeamToWelderRequest request)
    {
        await _seamManager.AssignSeamToWelderAsync(request);
        return Ok();
    }
    
    [HttpPut("assignInspector")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    public async Task<ActionResult> AssignSeamToInspectorAsync([FromBody] AssignSeamToInspectorRequest request)
    {
        await _seamManager.AssignSeamToInspectorAsync(request);
        return Ok();
    }
}