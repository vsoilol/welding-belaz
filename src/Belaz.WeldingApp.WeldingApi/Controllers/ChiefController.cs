using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Extensions;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ChiefController : ControllerBase
{
    private readonly IChiefService _chiefService;

    public ChiefController(IChiefService chiefService)
    {
        _chiefService = chiefService;
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<ChiefDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<ChiefDto>>> GetAllWeldersAsync()
    {
        return await _chiefService.GetAllAsync();
    }

    [HttpPost]
    [ProducesResponseType(typeof(ChiefDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ChiefDto>> CreateAsync([FromBody] CreateChiefRequest request)
    {
        var result = await _chiefService.CreateAsync(request);
        return result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(ChiefDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ChiefDto>> UpdateAsync([FromBody] UpdateChiefRequest request)
    {
        var result = await _chiefService.UpdateAsync(request);
        return result.ToOk();
    }
}