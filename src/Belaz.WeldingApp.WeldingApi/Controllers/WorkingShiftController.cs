using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Extensions;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
[AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
public class WorkingShiftController : ControllerBase
{
    private readonly IWorkingShiftService _workingShiftService;

    public WorkingShiftController(IWorkingShiftService workingShiftService)
    {
        _workingShiftService = workingShiftService;
    }

    [HttpPost]
    [ProducesResponseType(typeof(WorkingShiftDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WorkingShiftDto>> CreateAsync([FromBody] CreateWorkingShiftWithYearRequest request)
    {
        var result = await _workingShiftService.CreateAsync(request);
        return result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(WorkingShiftDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WorkingShiftDto>> UpdateAsync([FromBody] UpdateWorkingShiftRequest request)
    {
        var result = await _workingShiftService.UpdateAsync(request);
        return result.ToOk();
    }
}