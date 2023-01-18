using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Calendar;
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
public class CalendarController : ControllerBase
{
    private readonly ICalendarManager _calendarManager;

    public CalendarController(ICalendarManager calendarManager)
    {
        _calendarManager = calendarManager;
    }

    [HttpPost("main")]
    [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto?>> CreateMainCalendarAsync([FromBody] CreateCalendarRequest request)
    {
        return await _calendarManager.CreateAsync(request, true);
    }

    [HttpGet("main/{year}")]
    [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto?>> GetMainCalendarAsync([FromRoute] int year)
    {
        return await _calendarManager.GetMainCalendarByYearAsync(year);
    }

    [HttpPut]
    [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto?>> UpdateAsync([FromBody] UpdateCalendarRequest request)
    {
        return await _calendarManager.UpdateAsync(request);
    }

    [HttpPost("withWelder")]
    [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto?>> CreateMainCalendarAsync(
        [FromBody] CreateCalendarWithWelderIdRequest request)
    {
        return await _calendarManager.CreateAsync(request);
    }

    [HttpGet("byWelder")]
    [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto?>> GetByWelderIdAsync([FromQuery] GetByWelderIdRequest request)
    {
        return await _calendarManager.GetByWelderIdAsync(request);
    }
    
    [HttpPost("withEquipment")]
    [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto?>> CreateMainCalendarAsync(
        [FromBody] CreateCalendarWithEquipmentIdRequest request)
    {
        return await _calendarManager.CreateAsync(request);
    }

    [HttpGet("byEquipment")]
    [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto?>> GetByEquipmentIdAsync([FromQuery] GetByEquipmentIdRequest request)
    {
        return await _calendarManager.GetByEquipmentIdAsync(request);
    }
}