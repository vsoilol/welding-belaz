using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Welder;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[Route("api/welders")]
[ApiController]
public class WelderController : ControllerBase
{
    private readonly IWelderManager _welderManager;

    public WelderController(IWelderManager welderManager)
    {
        _welderManager = welderManager;
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<WelderDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<WelderDto>>> GetAllWeldersAsync()
    {
        return await _welderManager.GetAllAsync();
    }
}
