using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Workplace;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workplace;
using Belaz.WeldingApp.WeldingApi.Extensions;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class WorkplaceController : ControllerBase
{
    private readonly IWorkplaceService _workplaceService;

    public WorkplaceController(IWorkplaceService workplaceService)
    {
        _workplaceService = workplaceService;
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<WorkplaceDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WorkplaceDto>>> GetAllAsync()
    {
        return await _workplaceService.GetAllAsync();
    }

    [HttpGet("{id}")]
    [ProducesResponseType(typeof(WorkplaceDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WorkplaceDto>> GetByIdAsync([FromRoute] Guid id)
    {
        var result = await _workplaceService.GetByIdAsync(new GetWorkplaceByIdRequest { Id = id });
        return result.ToOk();
    }

    [HttpPost]
    [ProducesResponseType(typeof(WorkplaceDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WorkplaceDto>> CreateAsync([FromBody] CreateWorkplaceRequest request)
    {
        var result = await _workplaceService.CreateAsync(request);
        return result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(WorkplaceDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WorkplaceDto>> UpdateAsync([FromBody] UpdateWorkplaceRequest request)
    {
        var result = await _workplaceService.UpdateAsync(request);
        return result.ToOk();
    }
}