using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Inspector;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Extensions;
using LanguageExt;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
[AuthorizeRoles(Role.Admin, Role.Master, Role.Inspector, Role.Welder, Role.Chief)]
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
        return await _inspectorService.GetAllAsync();
    }

    [HttpPost]
    [ProducesResponseType(typeof(InspectorDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<InspectorDto>> CreateAsync(
        [FromBody] CreateInspectorRequest request
    )
    {
        var result = await _inspectorService.CreateAsync(request);
        return result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(InspectorDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<InspectorDto>> UpdateAsync(
        [FromBody] UpdateInspectorRequest request
    )
    {
        var result = await _inspectorService.UpdateAsync(request);
        return result.ToOk();
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<Unit>> DeleteAsync([FromRoute] Guid id)
    {
        var result = await _inspectorService.DeleteAsync(new DeleteInspectorRequest { Id = id });
        return result.ToOk();
    }
}
