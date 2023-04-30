using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.SeamAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Extensions;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Belaz.WeldingApp.Common.Attributes;
using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class SeamAccountController : ControllerBase
{
    private readonly ISeamAccountService _seamAccountService;

    public SeamAccountController(ISeamAccountService seamAccountService)
    {
        _seamAccountService = seamAccountService;
    }

    [HttpGet("byProductAccount/{productAccountId}")]
    [ProducesResponseType(typeof(List<SeamAccountDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<SeamAccountDto>>> GetAllByProductAccountIdAsync(
        [FromRoute] Guid productAccountId
    )
    {
        var result = await _seamAccountService.GetAllByProductAccountIdAsync(
            new GetAllByProductAccountIdRequest { ProductAccountId = productAccountId }
        );

        return result.ToOk();
    }

    [HttpPut("reason")]
    [ProducesResponseType(typeof(SeamAccountDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<SeamAccountDto>> SetSeamAccountDefectiveReasonAsync(
        [FromBody] SetSeamAccountDefectiveReasonRequest request
    )
    {
        var result = await _seamAccountService.SetSeamAccountDefectiveReasonAsync(request);

        return result.ToOk();
    }

    [HttpPut("defectiveAmount")]
    [ProducesResponseType(typeof(SeamAccountDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<SeamAccountDto>> ChangeDefectiveAmountAsync(
        [FromBody] ChangeSeamAccountDefectiveAmountRequest request
    )
    {
        var result = await _seamAccountService.ChangeDefectiveAmountAsync(request);

        return result.ToOk();
    }
}
