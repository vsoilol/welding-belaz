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
}