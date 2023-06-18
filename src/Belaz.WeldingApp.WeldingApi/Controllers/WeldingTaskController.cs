using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingTask;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;
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
public class WeldingTaskController : ControllerBase
{
    private readonly IWeldingTaskService _weldingTaskService;

    public WeldingTaskController(IWeldingTaskService weldingTaskService)
    {
        _weldingTaskService = weldingTaskService;
    }

    [HttpGet("uncompleted")]
    [ProducesResponseType(typeof(IEnumerable<WeldingTaskDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WeldingTaskDto>>> GetAllUncompletedTaskAsync()
    {
        return await _weldingTaskService.GetAllUncompletedTaskAsync();
    }

    [HttpGet("completed")]
    [ProducesResponseType(typeof(IEnumerable<WeldingTaskDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WeldingTaskDto>>> GetAllCompletedTaskAsync()
    {
        return await _weldingTaskService.GetAllCompletedTaskAsync();
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<WeldingTaskDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WeldingTaskDto>>> GetAllAsync()
    {
        return await _weldingTaskService.GetAllAsync();
    }

    [HttpPut]
    [ProducesResponseType(typeof(WeldingTaskDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WeldingTaskDto>> UpdateAsync(
        [FromBody] UpdateWeldingTaskRequest request
    )
    {
        var result = await _weldingTaskService.UpdateAsync(request);
        return result.ToOk();
    }

    [HttpPut("changeStatus")]
    [ProducesResponseType(typeof(WeldingTaskDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WeldingTaskDto>> ChangeWeldingTaskStatusAsync(
        [FromBody] ChangeWeldingTaskStatusRequest request
    )
    {
        var result = await _weldingTaskService.ChangeWeldingTaskStatusAsync(request);
        return result.ToOk();
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<Unit>> DeleteAsync([FromRoute] Guid id)
    {
        var result = await _weldingTaskService.DeleteAsync(
            new DeleteWeldingTaskRequest { Id = id }
        );
        return result.ToOk();
    }

    [HttpPut("changeDate")]
    [ProducesResponseType(typeof(WeldingTaskDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WeldingTaskDto>> ChangeWeldingTaskDateAsync(
        [FromBody] ChangeWeldingTaskDateRequest request
    )
    {
        var result = await _weldingTaskService.ChangeWeldingTaskDateAsync(request);
        return result.ToOk();
    }

    [HttpPut("changeSeamAmount")]
    [ProducesResponseType(typeof(WeldingTaskDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WeldingTaskDto>> ChangeWeldingTaskSeamAmountAsync(
        [FromBody] ChangeWeldingSeamAmountRequest request
    )
    {
        var result = await _weldingTaskService.ChangeWeldingTaskSeamAmountAsync(request);
        return result.ToOk();
    }

    [HttpGet("welding-material/{date}")]
    [ProducesResponseType(typeof(WeldingMaterialInfoDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WeldingMaterialInfoDto?>> GetWeldingMaterialInfoByDateAsync([FromRoute] string date)
    {
        var result =  await _weldingTaskService.GetWeldingMaterialInfoByDateAsync(
            new GetWeldingMaterialInfoByDateRequest
                { Date = date }
        );

        return result.ToOk();
    }
}