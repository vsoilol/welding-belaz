using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Extensions;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Belaz.WeldingApp.Common.Attributes;
using Belaz.WeldingApp.Common.Enums;
using LanguageExt;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class WorkingShiftController : ControllerBase
{
    private readonly IWorkingShiftService _workingShiftService;

    public WorkingShiftController(IWorkingShiftService workingShiftService)
    {
        _workingShiftService = workingShiftService;
    }

    [HttpPost]
    [ProducesResponseType(typeof(WorkingShiftDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WorkingShiftDto>> CreateAsync(
        [FromBody] CreateWorkingShiftWithYearRequest request
    )
    {
        var result = await _workingShiftService.CreateAsync(request);
        return result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(WorkingShiftDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WorkingShiftDto>> UpdateAsync(
        [FromBody] UpdateWorkingShiftRequest request
    )
    {
        var result = await _workingShiftService.UpdateAsync(request);
        return result.ToOk();
    }

    [HttpGet("{year}")]
    [ProducesResponseType(typeof(List<WorkingShiftDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<WorkingShiftDto>>> GetAllMainWorkingShiftsByYearAsync(
        [FromRoute] int year
    )
    {
        var result = await _workingShiftService.GetAllMainWorkingShiftsByYearAsync(
            new GetAllMainWorkingShiftsByYearRequest { Year = year }
        );

        return result.ToOk();
    }

    [HttpGet("byEquipment")]
    [ProducesResponseType(typeof(List<WorkingShiftDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<WorkingShiftDto>>> GetAllWorkingShiftsByEquipmentIdAndYearAsync(
        [FromQuery] GetAllWorkingShiftsByEquipmentIdAndYearRequest request
    )
    {
        var result = await _workingShiftService.GetAllWorkingShiftsByEquipmentIdAndYearAsync(request);

        return result.ToOk();
    }

    [HttpGet("byWelder")]
    [ProducesResponseType(typeof(List<WorkingShiftDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<WorkingShiftDto>>> GetAllWorkingShiftsByWelderIdAndYearAsync(
        [FromQuery] GetAllWorkingShiftsByWelderIdAndYearRequest request
    )
    {
        var result = await _workingShiftService.GetAllWorkingShiftsByWelderIdAndYearAsync(request);

        return result.ToOk();
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<Unit>> DeleteWorkingShiftAsync([FromRoute] Guid id)
    {
        var result = await _workingShiftService.DeleteWorkingShiftAsync(
            new DeleteWorkingShiftRequest() { Id = id }
        );

        return result.ToOk();
    }
}