using System.Net;
using System.Text.Json;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Exceptions;
using Belaz.WeldingApp.WeldingApi.Extensions;
using Microsoft.AspNetCore.Mvc;
using BadRequestResult = WeldingApp.Common.Models.BadRequestResult;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
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
        return result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(DayDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<DayDto>> UpdateAsync([FromBody] UpdateDayRequest request)
    {
        var result = await _dayService.UpdateAsync(request);
        return result.ToOk();
    }

    [HttpGet("main")]
    [ProducesResponseType(typeof(IEnumerable<DayDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<DayDto>>> GetAllMainAsync()
    {
        return await _dayService.GetAllMainAsync();
    }

    [HttpGet("byWelder/{welderId}")]
    [ProducesResponseType(typeof(List<DayDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<DayDto>>> GetAllByWelderIdAsync([FromRoute] Guid welderId)
    {
        var result = await _dayService.GetAllByWelderIdAsync(new GetDaysByWelderIdRequest { WelderId = welderId });
        return result.ToOk();
    }

    [HttpGet("byEquipment/{equipmentId}")]
    [ProducesResponseType(typeof(List<DayDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<DayDto>>> GetAllByEquipmentIdAsync([FromRoute] Guid equipmentId)
    {
        var result = await _dayService
            .GetAllByEquipmentIdAsync(new GetDaysByEquipmentIdRequest { EquipmentId = equipmentId });
        return result.ToOk();
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