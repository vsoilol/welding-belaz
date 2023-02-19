using Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Responses;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Services.Interfaces;
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
    [ProducesResponseType(typeof(IEnumerable<WelderWithEquipmentResponse>), StatusCodes.Status200OK)]
    public async Task<ActionResult<WelderWithEquipmentResponse>> GetWelderWithEquipmentAsync(
        [FromBody] GetWelderWithEquipmentRequest request)
    {
        var result = await _registarService.GetWelderWithEquipmentAsync(request);
        return result.ToOk();
    }

    [HttpPost("recordWithoutTask")]
    public async Task<ActionResult<Unit>> CreateRecordWithoutTaskAsync([FromBody] RecordWithoutTaskRequest request)
    {
        var result = await _registarService.CreateRecordWithoutTaskAsync(request);
        return result.ToOk();
    }
}