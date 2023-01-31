using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.Extensions;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class TechnologicalProcessController : ControllerBase
{
    private readonly ITechnologicalProcessService _technologicalProcessService;

    public TechnologicalProcessController(ITechnologicalProcessService technologicalProcessService)
    {
        _technologicalProcessService = technologicalProcessService;
    }

    [HttpGet("{id}")]
    [ProducesResponseType(typeof(TechnologicalProcessDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<TechnologicalProcessDto>> GetByIdAsync([FromRoute] Guid id)
    {
        var result = await _technologicalProcessService
            .GetByIdAsync(new GetTechnologicalProcessByIdRequest { Id = id });
        return result.ToOk();
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<TechnologicalProcessDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<TechnologicalProcessDto>>> GetAllAsync()
    {
        return await _technologicalProcessService.GetAllAsync();
    }

    [HttpPost]
    [ProducesResponseType(typeof(TechnologicalProcessDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<TechnologicalProcessDto>> CreateAsync(
        [FromBody] CreateTechnologicalProcessRequest request)
    {
        var result = await _technologicalProcessService.CreateAsync(request);
        return result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(TechnologicalProcessDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<TechnologicalProcessDto>> UpdateAsync(
        [FromBody] UpdateTechnologicalProcessRequest request)
    {
        var result = await _technologicalProcessService.UpdateAsync(request);
        return result.ToOk();
    }
}