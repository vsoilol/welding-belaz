using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Inspector;
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
public class DowntimeReasonController : ControllerBase
{
    private readonly IDowntimeReasonManager _downtimeReasonManager;

    public DowntimeReasonController(IDowntimeReasonManager downtimeReasonManager)
    {
        _downtimeReasonManager = downtimeReasonManager;
    }
    
    [HttpGet]
    [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<DowntimeReasonDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<DowntimeReasonDto>>> GetAllAsync()
    {
        return await _downtimeReasonManager.GetAllAsync();
    }
}