

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
    public async Task<ActionResult<DayDto?>> UpdateAsync([FromBody] UpdateDayRequest request)
    {
        return await _dayService.UpdateAsync(request);
    }
    
    [HttpGet("main")]
    [ProducesResponseType(typeof(IEnumerable<DayDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<DayDto>>> GetAllMainAsync()
    {
        return await _dayService.GetAllMainAsync();
    }
    
    [HttpGet("byWelder/{welderId}")]
    [ProducesResponseType(typeof(IEnumerable<DayDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<DayDto>>> GetAllByWelderIdAsync([FromRoute] Guid welderId)
    {
        return await _dayService.GetAllByWelderIdAsync(welderId);
    }
    
    [HttpGet("byEquipment/{equipmentId}")]
    [ProducesResponseType(typeof(IEnumerable<DayDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<DayDto>>> GetAllByEquipmentIdAsync([FromRoute] Guid equipmentId)
    {
        return await _dayService.GetAllByEquipmentIdAsync(equipmentId);
    }
}