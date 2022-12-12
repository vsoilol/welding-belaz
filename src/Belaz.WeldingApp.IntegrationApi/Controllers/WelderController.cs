using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Welder;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.IntegrationApi.Controllers;

[Route("api/welders")]
[ApiController]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class WelderController : ControllerBase
{
    private readonly IWelderIntegrationApi _welderIntegrationApi;

    public WelderController(IWelderIntegrationApi welderIntegrationApi)
    {
        _welderIntegrationApi = welderIntegrationApi;
    }

    [HttpGet]
    [AuthorizeRoles(Role.Admin,Role.Master,Role.TechUser)]
    public async Task<ActionResult<IEnumerable<WelderDto>>> GetAllWeldersAsync()
    {
        return await _welderIntegrationApi.GetAllWeldersAsync();
    }
}
