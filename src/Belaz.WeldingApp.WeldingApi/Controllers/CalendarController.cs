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
[AuthorizeRoles(Role.Admin, Role.Master, Role.Inspector, Role.Welder, Role.Chief)]
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
        return result.ToOk(_ =>
        {
            HttpContext.Items[ContextItems.LogMessage] =
                $"Создание производственного календаря на {_.Year}.";
        });
    }

    [HttpGet("main/{year}")]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto?>> GetMainCalendarByYearAsync([FromRoute] int year)
    {
        var result = await _calendarService.GetMainCalendarByYearAsync(
            new GetMainCalendarByYearRequest { Year = year }
        );
        return result.ToOk(_ =>
        {
            if (_ is not null)
            {
                HttpContext.Items[ContextItems.LogMessage] =
                    $"Получение производственного календаря на {_.Year}.";
            }
        });
    }

    [HttpPut]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto>> UpdateAsync(
        [FromBody] UpdateCalendarRequest request
    )
    {
        var result = await _calendarService.UpdateAsync(request);
        return result.ToOk(_ =>
        {
            HttpContext.Items[ContextItems.LogMessage] =
                $"Обновление производственного календаря на {_.Year}.";
        });
    }

    [HttpPost("withWelder")]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto>> CreateForWelderAsync(
        [FromBody] CreateCalendarWithWelderIdRequest request
    )
    {
        var result = await _calendarService.CreateForWelderAsync(request);
        return result.ToOk(_ =>
        {
            HttpContext.Items[ContextItems.LogMessage] =
                $"Создание производственного календаря для сварщика на {_.Year}.";
        });
    }

    [HttpGet("byWelder")]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto?>> GetByWelderIdAsync(
        [FromQuery] GetByWelderIdRequest request
    )
    {
        var result = await _calendarService.GetByWelderIdAndYearAsync(request);
        return result.ToOk(_ =>
        {
            if (_ is not null)
            {
                HttpContext.Items[ContextItems.LogMessage] =
                    $"Получение производственного календаря для сварщика на {_.Year}.";
            }
        });
    }

    [HttpPost("withEquipment")]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto>> CreateForEquipmentAsync(
        [FromBody] CreateCalendarWithEquipmentIdRequest request
    )
    {
        var result = await _calendarService.CreateForEquipmentAsync(request);
        return result.ToOk(_ =>
        {
            HttpContext.Items[ContextItems.LogMessage] =
                $"Создание производственного календаря для сварочного оборудования на {_.Year}.";
        });
    }

    [HttpGet("byEquipment")]
    [ProducesResponseType(typeof(CalendarDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<CalendarDto?>> GetByEquipmentIdAsync(
        [FromQuery] GetByEquipmentIdRequest request
    )
    {
        var result = await _calendarService.GetByEquipmentIdAndYearAsync(request);
        return result.ToOk();
    }
}