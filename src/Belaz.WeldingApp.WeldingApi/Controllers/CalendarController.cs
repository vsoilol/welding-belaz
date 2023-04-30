using Belaz.WeldingApp.Common.Attributes;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Contracts;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Extensions;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class CalendarController : ControllerBase
{
    private readonly ICalendarService _calendarService;

    public CalendarController(ICalendarService calendarService)
    {
        _calendarService = calendarService;
    }

    [HttpPost("main")]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto>> CreateMainCalendarAsync(
        [FromBody] CreateCalendarRequest request
    )
    {
        var result = await _calendarService.CreateAsync(request, true);
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;

        return result.Result.ToOk();
    }

    [HttpGet("main/{year}")]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto?>> GetMainCalendarByYearAsync([FromRoute] int year)
    {
        var result = await _calendarService.GetMainCalendarByYearAsync(
            new GetMainCalendarByYearRequest { Year = year }
        );
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;

        return result.Result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto>> UpdateAsync(
        [FromBody] UpdateCalendarRequest request
    )
    {
        var result = await _calendarService.UpdateAsync(request);
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;

        return result.Result.ToOk();
    }

    [HttpPost("withWelder")]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto>> CreateForWelderAsync(
        [FromBody] CreateCalendarWithWelderIdRequest request
    )
    {
        var result = await _calendarService.CreateForWelderAsync(request);
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;

        return result.Result.ToOk();
    }

    [HttpGet("byWelder")]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto?>> GetByWelderIdAsync(
        [FromQuery] GetByWelderIdRequest request
    )
    {
        var result = await _calendarService.GetByWelderIdAndYearAsync(request);
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;

        return result.Result.ToOk();
    }

    [HttpPost("withEquipment")]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto>> CreateForEquipmentAsync(
        [FromBody] CreateCalendarWithEquipmentIdRequest request
    )
    {
        var result = await _calendarService.CreateForEquipmentAsync(request);
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;

        return result.Result.ToOk();
    }

    [HttpGet("byEquipment")]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto?>> GetByEquipmentIdAsync(
        [FromQuery] GetByEquipmentIdRequest request
    )
    {
        var result = await _calendarService.GetByEquipmentIdAndYearAsync(request);
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;

        return result.Result.ToOk();
    }
}