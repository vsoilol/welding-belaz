using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.Extensions;
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
public class TechnologicalInstructionController : ControllerBase
{
    private readonly ITechnologicalInstructionService _technologicalInstructionService;

    public TechnologicalInstructionController(ITechnologicalInstructionService technologicalInstructionService)
    {
        _technologicalInstructionService = technologicalInstructionService;
    }

    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<TechnologicalInstructionDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IEnumerable<TechnologicalInstructionDto>>> GetAllAsync()
    {
        return await _technologicalInstructionService.GetAllAsync();
    }

    [HttpPost]
    [ProducesResponseType(typeof(TechnologicalInstructionDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<TechnologicalInstructionDto>> CreateAsync(
        [FromBody] CreateInstructionRequest request)
    {
        var result = await _technologicalInstructionService.CreateAsync(request);
        return result.ToOk();
    }

    [HttpPut]
    [ProducesResponseType(typeof(TechnologicalInstructionDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<TechnologicalInstructionDto>> UpdateAsync(
        [FromBody] UpdateInstructionRequest request)
    {
        var result = await _technologicalInstructionService.UpdateAsync(request);
        return result.ToOk();
    }
}