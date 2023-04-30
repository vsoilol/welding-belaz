using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Belaz.WeldingApp.Common.Attributes;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.Contracts;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
[AuthorizeRoles(Role.Admin, Role.Master, Role.Inspector, Role.Welder, Role.Chief)]
public class DowntimeReasonController : ControllerBase
{
    private readonly IDowntimeReasonService _downtimeReasonService;

    public DowntimeReasonController(IDowntimeReasonService downtimeReasonService)
    {
        _downtimeReasonService = downtimeReasonService;
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<DowntimeReasonDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<DowntimeReasonDto>>> GetAllAsync()
    {
        var result = await _downtimeReasonService.GetAllAsync();
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;

        return result.Result;
    }
}
