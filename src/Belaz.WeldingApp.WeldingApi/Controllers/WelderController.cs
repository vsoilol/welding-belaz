using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Welder;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Extensions;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[Route("api/[controller]")]
[ApiController]
public class WelderController : ControllerBase
{
    private readonly IWelderService _welderService;

    public WelderController(IWelderService welderService)
    {
        _welderService = welderService;
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<WelderDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WelderDto>>> GetAllWeldersAsync()
    {
        return await _welderService.GetAllAsync();
    }

    [HttpPost]
    [ProducesResponseType(typeof(WelderDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WelderDto>> CreateAsync([FromBody] CreateWelderRequest request)
    {
        var result = await _welderService.CreateAsync(request);
        return result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(WelderDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WelderDto>> UpdateAsync([FromBody] UpdateWelderRequest request)
    {
        var result = await _welderService.UpdateAsync(request);
        return result.ToOk();
    }
}