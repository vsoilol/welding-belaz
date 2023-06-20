using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Extensions;
using LanguageExt;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Belaz.WeldingApp.Common.Attributes;
using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class WeldingRecordController : ControllerBase
{
    private readonly IWeldingRecordService _weldingRecordService;

    public WeldingRecordController(IWeldingRecordService weldingRecordService)
    {
        _weldingRecordService = weldingRecordService;
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<RecordDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<RecordDto>>> GetAllWeldingEquipmentsAsync()
    {
        return await _weldingRecordService.GetAllAsync();
    }

    [HttpGet("with-deviations")]
    [ProducesResponseType(typeof(IEnumerable<RecordDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<RecordDto>>> GetAllWithDeviationsAsync()
    {
        return await _weldingRecordService.GetAllWithDeviationsAsync();
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<Unit>> DeleteAsync([FromRoute] Guid id)
    {
        var result = await _weldingRecordService.DeleteAsync(
            new DeleteWeldingRecordRequest { Id = id }
        );
        return result.ToOk();
    }

    [HttpGet("limits")]
    [ProducesResponseType(typeof(WeldingRecordLimitDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WeldingRecordLimitDto>> GetWeldingRecordLimitAsync()
    {
        return await _weldingRecordService.GetWeldingRecordLimitAsync();
    }

    [HttpPut("limits")]
    [ProducesResponseType(typeof(WeldingRecordLimitDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WeldingRecordLimitDto>> UpdateWeldingRecordLimitAsync(
        [FromBody] UpdateWeldingRecordLimitRequest request)
    {
        var result = await _weldingRecordService.UpdateWeldingRecordLimitAsync(request);
        return result.ToOk();
    }

    [HttpGet("period")]
    [ProducesResponseType(typeof(List<RecordDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<RecordDto>>> GetRecordsByDatePeriodAsync(
        [FromQuery] GetRecordsByDatePeriodRequest request)
    {
        var result = await _weldingRecordService.GetRecordsByDatePeriodAsync(request);
        return result.ToOk();
    }
}