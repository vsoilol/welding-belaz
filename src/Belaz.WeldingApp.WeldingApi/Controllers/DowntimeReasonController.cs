using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class DowntimeReasonController : ControllerBase
{
    private readonly IDowntimeReasonService _downtimeReasonService;

    public DowntimeReasonController(IDowntimeReasonService downtimeReasonService)
    {
        _downtimeReasonService = downtimeReasonService;
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<DowntimeReasonDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<DowntimeReasonDto>>> GetAllAsync()
    {
        return await _downtimeReasonService.GetAllAsync();
    }
}