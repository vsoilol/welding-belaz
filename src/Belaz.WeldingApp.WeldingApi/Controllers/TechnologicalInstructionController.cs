using Belaz.WeldingApp.WeldingApi.Contracts.Requests.TechnologicalInstruction;
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
public class TechnologicalInstructionController : ControllerBase
{
    private readonly ITechnologicalInstructionManager _technologicalInstructionManager;

    public TechnologicalInstructionController(ITechnologicalInstructionManager technologicalInstructionManager)
    {
        _technologicalInstructionManager = technologicalInstructionManager;
    }
    
    [HttpGet]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<TechnologicalInstructionDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<TechnologicalInstructionDto>>> GetAllAsync()
    {
        return await _technologicalInstructionManager.GetAllAsync();
    }
    
    [HttpPost]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    public async Task<IActionResult> CreateAsync([FromBody] CreateInstructionRequest request)
    {
        await _technologicalInstructionManager.CreateAsync(request);
        return Ok();
    }
}