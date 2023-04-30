using Belaz.WeldingApp.Common.Attributes;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.EventLog;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Extensions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

public class EventLogController : ApiBaseController
{
    private readonly IEventLogService _eventLogService;

    public EventLogController(IEventLogService eventLogService)
    {
        _eventLogService = eventLogService;
    }
    
    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<EventLogDto>), StatusCodes.Status200OK)]
    [AuthorizeRoles(Role.Admin)]
    public async Task<ActionResult<IEnumerable<EventLogDto>>> GetAllAsync()
    {
        return await _eventLogService.GetAllAsync();
    }
    
    [HttpPost]
    [Authorize]
    [ProducesResponseType(typeof(EventLogDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<EventLogDto>> AddAsync([FromBody] AddEventLogRequest request)
    {
        var userId = GetUserId();
        var result = await _eventLogService.AddAsync(request, userId);
        return result.ToOk();
    }
}