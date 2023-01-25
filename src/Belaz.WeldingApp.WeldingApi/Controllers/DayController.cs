using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Day;
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
public class DayController : ControllerBase
{
    private readonly IDayManager _dayManager;

    public DayController(IDayManager dayManager)
    {
        _dayManager = dayManager;
    }

    [HttpPost]
    [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
    [ProducesResponseType(typeof(DayDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<DayDto?>> CreateAsync([FromBody] CreateDayWithYearRequest request)
    {
        return await _dayManager.CreateAsync(request);
    }

    [HttpPut]
    [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
    [ProducesResponseType(typeof(DayDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<DayDto?>> UpdateAsync([FromBody] UpdateDayRequest request)
    {
        return await _dayManager.UpdateAsync(request);
    }
    
    [HttpGet("main")]
    [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<DayDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<DayDto>>> GetAllMainAsync()
    {
        return await _dayManager.GetAllMainAsync();
    }
    
    [HttpGet("byWelder/{welderId}")]
    [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<DayDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<DayDto>>> GetAllByWelderIdAsync([FromRoute] Guid welderId)
    {
        return await _dayManager.GetAllByWelderIdAsync(welderId);
    }
    
    [HttpGet("byEquipment/{equipmentId}")]
    [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<DayDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<DayDto>>> GetAllByEquipmentIdAsync([FromRoute] Guid equipmentId)
    {
        return await _dayManager.GetAllByEquipmentIdAsync(equipmentId);
    }
}