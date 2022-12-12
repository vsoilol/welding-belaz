using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Welder;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.IntegrationApi.Controllers;

[Route("api/welders")]
[ApiController]
public class WelderController : ControllerBase
{
    private readonly IWelderIntegrationApi _welderIntegrationApi;

    public WelderController(IWelderIntegrationApi welderIntegrationApi)
    {
        _welderIntegrationApi = welderIntegrationApi;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<WelderDto>>> GetAllWeldersAsync()
    {
        return await _welderIntegrationApi.GetAllWeldersAsync();
    }
}
