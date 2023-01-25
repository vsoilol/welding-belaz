using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class CalendarController : ControllerBase
{
    private readonly ICalendarRepository _calendarManager;

    public CalendarController(ICalendarRepository calendarManager)
    {
        _calendarManager = calendarManager;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<CalendarDto>>> GetMainCalendarAsync()
    {
        return await _calendarManager.GetAllAsync();
    }
}