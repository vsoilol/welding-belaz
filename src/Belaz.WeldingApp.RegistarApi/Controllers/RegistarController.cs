using Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Responses;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Belaz.WeldingApp.RegistarApi.Extensions;
using LanguageExt;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Serilog;

namespace Belaz.WeldingApp.RegistarApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class RegistarController : ControllerBase
{
    private readonly IRegistarService _registarService;

    private readonly ILogger<RegistarController> _logger;

    public RegistarController(IRegistarService registarService, ILogger<RegistarController> logger)
    {
        _registarService = registarService;
        _logger = logger;
    }

    [HttpPost("identificate")]
    [ProducesResponseType(
        typeof(IEnumerable<WelderWithEquipmentResponse>),
        StatusCodes.Status200OK
    )]
    public async Task<ActionResult<WelderWithEquipmentResponse>> GetWelderWithEquipmentAsync(
        [FromBody] GetWelderWithEquipmentRequest request
    )
    {
        _logger.LogInformation("Identificate request: {@Data}", request);

        var result = await _registarService.GetWelderWithEquipmentAsync(request);
        var data = result.ToOk();
        
        _logger.LogInformation("Identificate response: {@Data}", data.Result);
        
        return data;
    }

    [HttpPost("recordWithoutTask")]
    public async Task<ActionResult<Unit>> CreateRecordWithoutTaskAsync(
        [FromBody] RecordWithoutTaskRequest request
    )
    {
        _logger.LogInformation("RecordWithoutTask request: {@Data}", request);
        
        var result = await _registarService.CreateRecordWithoutTaskAsync(request);
        var data = result.ToOk();
        
        _logger.LogInformation("RecordWithoutTask response: {@Data}", data.Result);
        
        return data;
    }

    [HttpPost("tasks")]
    public async Task<
        ActionResult<List<WeldingTaskBriefResponse>>
    > GetAllTasksByDateAndEquipmentAsync([FromBody] GetAllTasksByDateAndEquipmentRequest request)
    {
        var result = await _registarService.GetAllTasksByDateAndEquipmentAsync(request);
        return result.ToOk();
    }

    [HttpPost("chosenTask")]
    public async Task<ActionResult<WeldingTaskResponse>> GetTaskByIdAsync(
        [FromBody] GetTaskByIdRequest request
    )
    {
        var result = await _registarService.GetTaskByIdAsync(request);
        return result.ToOk();
    }

    [HttpPost("recordWithTask")]
    public async Task<ActionResult<Unit>> CreateRecordWithTaskAsync(
        [FromBody] RecordWithTaskRequest request
    )
    {
        _logger.LogInformation("RecordWithTask request: {@Data}", request);
        
        var result = await _registarService.CreateRecordWithTaskAsync(request);
        var data = result.ToOk();
        
        _logger.LogInformation("RecordWithTask response: {@Data}", data.Result);
        
        return data;
    }

    [HttpPost("completeTask")]
    public async Task<ActionResult<Unit>> MarkWeldingTaskAsCompletedAsync(
        [FromBody] MarkWeldingTaskAsCompletedRequest request
    )
    {
        var result = await _registarService.MarkWeldingTaskAsCompletedAsync(request);
        return result.ToOk();
    }
}