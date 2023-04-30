using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Extensions;
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
public class DayController : ControllerBase
{
    private readonly IDayService _dayService;

    public DayController(IDayService dayService)
    {
        _dayService = dayService;
    }

    [HttpPost]
    [ProducesResponseType(typeof(DayDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<DayDto>> CreateAsync([FromBody] CreateDayWithYearRequest request)
    {
        var result = await _dayService.CreateAsync(request);
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;
        
        return result.Result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(DayDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<DayDto>> UpdateAsync([FromBody] UpdateDayRequest request)
    {
        var result = await _dayService.UpdateAsync(request);
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;
        
        return result.Result.ToOk();
    }

    [HttpGet("main")]
    [ProducesResponseType(typeof(IEnumerable<DayDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<DayDto>>> GetAllMainAsync()
    {
        var result = await _dayService.GetAllMainAsync();
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;

        return result.Result;
    }

    [HttpGet("byWelder/{welderId}")]
    [ProducesResponseType(typeof(List<DayDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<DayDto>>> GetAllByWelderIdAsync([FromRoute] Guid welderId)
    {
        var result = await _dayService.GetAllByWelderIdAsync(
            new GetDaysByWelderIdRequest { WelderId = welderId }
        );
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;
        
        return result.Result.ToOk();
    }

    [HttpGet("byEquipment/{equipmentId}")]
    [ProducesResponseType(typeof(List<DayDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<DayDto>>> GetAllByEquipmentIdAsync(
        [FromRoute] Guid equipmentId
    )
    {
        var result = await _dayService.GetAllByEquipmentIdAsync(
            new GetDaysByEquipmentIdRequest { EquipmentId = equipmentId }
        );
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;
        
        return result.Result.ToOk();
    }
}
