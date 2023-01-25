using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ChiefController : ControllerBase
{
    private readonly IChiefRepository _chiefManager;
    private readonly IChiefService _chiefService;

    public ChiefController(IChiefRepository chiefManager, IChiefService chiefService)
    {
        _chiefManager = chiefManager;
        _chiefService = chiefService;
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<ChiefDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<ChiefDto>>> GetAllAsync()
    {
        return await _chiefManager.GetAllAsync();
    }

    [HttpPost]
    public async Task<ActionResult<ChiefDto?>> CreateAsync([FromBody] CreateChiefRequest request)
    {
        return await _chiefService.CreateAsync(request);
    }
}