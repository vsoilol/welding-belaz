using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Welder;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Welder;
using Belaz.WeldingApp.WeldingApi.Extensions;
using LanguageExt;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Belaz.WeldingApp.Common.Attributes;
using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
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
    
    [HttpGet("{id}")]
    [ProducesResponseType(typeof(WelderDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<WelderDto>> GetByIdAsync([FromRoute] Guid id)
    {
        var result = await _welderService.GetByIdAsync(new GetWelderByIdRequest { Id = id });

        return result.ToOk();
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

    [HttpDelete("{id}")]
    public async Task<ActionResult<Unit>> DeleteAsync([FromRoute] Guid id)
    {
        var result = await _welderService.DeleteAsync(new DeleteWelderRequest { Id = id });
        return result.ToOk();
    }
}
