using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Master;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class MasterController : ControllerBase
{
    private readonly IMasterManager _masterManager;

    public MasterController(IMasterManager masterManager)
    {
        _masterManager = masterManager;
    }

    [HttpGet]
    [AuthorizeRoles(Role.Admin, Role.Master, Role.TechUser)]
    [ProducesResponseType(typeof(IEnumerable<MasterDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<MasterDto>>> GetAllWeldersAsync()
    {
        return await _masterManager.GetAllAsync();
    }
}