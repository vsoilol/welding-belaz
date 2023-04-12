using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Master;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Master;
using Belaz.WeldingApp.WeldingApi.Extensions;
using LanguageExt;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WeldingApp.Common.Attributes;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
[AuthorizeRoles(Role.Admin, Role.Master, Role.Inspector, Role.Welder, Role.Chief)]
public class MasterController : ControllerBase
{
    private readonly IMasterService _masterService;

    public MasterController(IMasterService masterService)
    {
        _masterService = masterService;
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<MasterDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<MasterDto>>> GetAllWeldersAsync()
    {
        return await _masterService.GetAllAsync();
    }

    [HttpPost]
    [ProducesResponseType(typeof(MasterDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<MasterDto>> CreateAsync([FromBody] CreateMasterRequest request)
    {
        var result = await _masterService.CreateAsync(request);
        return result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(MasterDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<MasterDto>> UpdateAsync([FromBody] UpdateMasterRequest request)
    {
        var result = await _masterService.UpdateAsync(request);
        return result.ToOk();
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<Unit>> DeleteAsync([FromRoute] Guid id)
    {
        var result = await _masterService.DeleteAsync(new DeleteMasterRequest { Id = id });
        return result.ToOk();
    }
}
