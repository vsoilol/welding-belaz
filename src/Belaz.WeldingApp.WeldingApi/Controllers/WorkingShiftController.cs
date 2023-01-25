using Belaz.WeldingApp.WeldingApi.Contracts.Requests.WorkingShift;
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
public class WorkingShiftController : ControllerBase
{
    private readonly IWorkingShiftManager _workingShiftManager;

    public WorkingShiftController(IWorkingShiftManager workingShiftManager)
    {
        _workingShiftManager = workingShiftManager;
    }
    
    [HttpPost]
    [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
    [ProducesResponseType(typeof(WorkingShiftDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WorkingShiftDto?>> CreateAsync([FromBody] CreateWorkingShiftWithYearRequest request)
    {
        return await _workingShiftManager.CreateAsync(request);
    }
    
    [HttpPut]
    [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
    [ProducesResponseType(typeof(WorkingShiftDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WorkingShiftDto?>> UpdateAsync([FromBody] UpdateWorkingShiftRequest request)
    {
        return await _workingShiftManager.UpdateAsync(request);
    }
}