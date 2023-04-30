using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;
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
public class ChiefController : ControllerBase
{
    private readonly IChiefService _chiefService;

    public ChiefController(IChiefService chiefService)
    {
        _chiefService = chiefService;
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<ChiefDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<ChiefDto>>> GetAllAsync()
    {
        var result = await _chiefService.GetAllAsync();
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;

        return result.Result;
    }

    [HttpPost]
    [ProducesResponseType(typeof(ChiefDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ChiefDto>> CreateAsync([FromBody] CreateChiefRequest request)
    {
        var result = await _chiefService.CreateAsync(request);
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;
        
        return result.Result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(ChiefDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ChiefDto>> UpdateAsync([FromBody] UpdateChiefRequest request)
    {
        var result = await _chiefService.UpdateAsync(request);
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;
        
        return result.Result.ToOk();
    }
}
