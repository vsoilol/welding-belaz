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
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
[AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
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
        return await _downtimeReasonService.GetAllAsync();
    }
}