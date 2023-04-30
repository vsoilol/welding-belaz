using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Inspector;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Extensions;
using LanguageExt;
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
public class InspectorController : ControllerBase
{
    private readonly IInspectorService _inspectorService;

    public InspectorController(IInspectorService inspectorService)
    {
        _inspectorService = inspectorService;
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<InspectorDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<InspectorDto>>> GetAllWeldersAsync()
    {
        var result = await _inspectorService.GetAllAsync();
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;

        return result.Result;
    }

    [HttpPost]
    [ProducesResponseType(typeof(InspectorDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<InspectorDto>> CreateAsync(
        [FromBody] CreateInspectorRequest request
    )
    {
        var result = await _inspectorService.CreateAsync(request);
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;

        return result.Result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(InspectorDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<InspectorDto>> UpdateAsync(
        [FromBody] UpdateInspectorRequest request
    )
    {
        var result = await _inspectorService.UpdateAsync(request);
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;

        return result.Result.ToOk();
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<Unit>> DeleteAsync([FromRoute] Guid id)
    {
        var result = await _inspectorService.DeleteAsync(new DeleteInspectorRequest { Id = id });
        
        HttpContext.Items[ContextItems.LogMessage] = result.LogMessage;

        return result.Result.ToOk();
    }
}
