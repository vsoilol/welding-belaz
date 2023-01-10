using System.Net;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Workshop;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Workshop;
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
public class WorkshopController : ControllerBase
{
    private readonly IWorkshopManager _workshopManager;

    public WorkshopController(IWorkshopManager workshopManager)
    {
        _workshopManager = workshopManager;
    }
    
    [HttpGet]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<WorkshopDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WorkshopDto>>> GetAllAsync()
    {
        return await _workshopManager.GetAllAsync();
    }
    
    [HttpGet("{id}")]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(WorkshopDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WorkshopDto?>> GetByIdAsync([FromRoute] Guid id)
    {
        return await _workshopManager.GetByIdAsync(id);
    }
    
    [HttpPost]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(WorkshopDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WorkshopDto?>> CreateAsync([FromBody] CreateWorkshopRequest request)
    {
        return await _workshopManager.CreateAsync(request);
    }
    
    [HttpPut]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    [ProducesResponseType(typeof(WorkshopDto), StatusCodes.Status200OK)]
    public async Task<IActionResult> UpdateAsync([FromBody] UpdateWorkshopRequest request)
    {
        var result = await _workshopManager.UpdateAsync(request);

        if (!result)
        {
            var problemDetails = new BadRequestResult
            {
                Title = "Update Error",
                StatusCode = (int) (HttpStatusCode.BadRequest),
                Errors = $"Error when update Workshop with id {request.Id}",
            };

            return BadRequest(problemDetails);
        }
        
        return Ok();
    }
}