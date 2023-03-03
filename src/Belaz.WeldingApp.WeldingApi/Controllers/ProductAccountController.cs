using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;
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
public class ProductAccountController : ControllerBase
{
    private readonly IProductAccountService _productAccountService;

    public ProductAccountController(IProductAccountService productAccountService)
    {
        _productAccountService = productAccountService;
    }

    [HttpGet("dates/{productionAreaId}")]
    [ProducesResponseType(typeof(List<string>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<string>>> GetAllDatesByProductionAreaAsync(
        [FromRoute] Guid productionAreaId
    )
    {
        var result = await _productAccountService.GetAllDatesByProductionAreaAsync(
            new ProductionAreaIdRequest { ProductionAreaId = productionAreaId }
        );

        return result.ToOk();
    }

    [HttpGet("byDate")]
    [ProducesResponseType(typeof(List<ProductAccountDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<ProductAccountDto>>> GetAllByDateAsync(
        [FromQuery] GetAllProductAccountsByDateRequest request
    )
    {
        var result = await _productAccountService.GetAllByDateAsync(request);

        return result.ToOk();
    }

    [HttpPut("manufacturedAmount")]
    [ProducesResponseType(typeof(ChangeProductAccountAmountRequest), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductAccountDto>> ChangeManufacturedAmountAsync(
        [FromBody] ChangeProductAccountAmountRequest request
    )
    {
        var result = await _productAccountService.ChangeManufacturedAmountAsync(request);

        return result.ToOk();
    }

    [HttpPut("amountFromPlan")]
    [ProducesResponseType(typeof(ChangeProductAccountAmountRequest), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductAccountDto>> ChangAmountFromPlanAsync(
        [FromBody] ChangeProductAccountAmountRequest request
    )
    {
        var result = await _productAccountService.ChangAmountFromPlanAsync(request);

        return result.ToOk();
    }

    [HttpPut("assignWelders")]
    public async Task<ActionResult<Unit>> AssignProductAccountToWeldersAsync(
        [FromBody] AssignProductAccountToWeldersRequest request
    )
    {
        var result = await _productAccountService.AssignProductAccountToWeldersAsync(request);

        return result.ToOk();
    }

    [HttpPost("generateTasks")]
    public async Task<ActionResult<Unit>> GenerateTasksAsync(
        [FromBody] GenerateTasksRequest request
    )
    {
        var result = await _productAccountService.GenerateTasksAsync(request);

        return result.ToOk();
    }

    [HttpPut("changeOrder")]
    [ProducesResponseType(typeof(List<ProductAccountDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<ProductAccountDto>>> ChangeOrderAsync(
        [FromBody] ChangeOrderRequest request
    )
    {
        var result = await _productAccountService.ChangeOrderAsync(request);

        return result.ToOk();
    }

    [HttpPost("generateByDate")]
    [ProducesResponseType(typeof(List<ProductAccountDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<ProductAccountDto>>> GenerateByDateAsync(
        [FromBody] GenerateProductAccountsByDateRequest request
    )
    {
        var result = await _productAccountService.GenerateByDateAsync(request);

        return result.ToOk();
    }
}
