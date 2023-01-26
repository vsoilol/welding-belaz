
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class WorkingShiftController : ControllerBase
{
    private readonly IWorkingShiftService _workingShiftService;

    public WorkingShiftController(IWorkingShiftService workingShiftService)
    {
        _workingShiftService = workingShiftService;
    }

    [HttpPost]
    [ProducesResponseType(typeof(WorkingShiftDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WorkingShiftDto?>> CreateAsync([FromBody] CreateWorkingShiftWithYearRequest request)
    {
        return await _workingShiftService.CreateAsync(request);
    }
    
    [HttpPut]
    [ProducesResponseType(typeof(WorkingShiftDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WorkingShiftDto?>> UpdateAsync([FromBody] UpdateWorkingShiftRequest request)
    {
        return await _workingShiftService.UpdateAsync(request);
    }
}