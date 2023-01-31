using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Inspector;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Extensions;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
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
    public async Task<ActionResult<InspectorDto>> CreateAsync([FromBody] CreateInspectorRequest request)
    {
        var result = await _inspectorService.CreateAsync(request);
        return result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(InspectorDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<InspectorDto>> UpdateAsync([FromBody] UpdateInspectorRequest request)
    {
        var result = await _inspectorService.UpdateAsync(request);
        return result.ToOk();
    }
}