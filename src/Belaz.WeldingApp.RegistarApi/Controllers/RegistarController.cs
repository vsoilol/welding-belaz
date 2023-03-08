using Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Responses;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Belaz.WeldingApp.RegistarApi.Extensions;
using LanguageExt;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.RegistarApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class RegistarController : ControllerBase
{
    private readonly IRegistarService _registarService;

    public RegistarController(IRegistarService registarService)
    {
        _registarService = registarService;
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
        var result = await _registarService.GetWelderWithEquipmentAsync(request);
        return result.ToOk();
    }

    [HttpPost("recordWithoutTask")]
    public async Task<ActionResult<Unit>> CreateRecordWithoutTaskAsync(
        [FromBody] RecordWithoutTaskRequest request
    )
    {
        var result = await _registarService.CreateRecordWithoutTaskAsync(request);
        return result.ToOk();
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
        var result = await _registarService.CreateRecordWithTaskAsync(request);
        return result.ToOk();
    }
}
