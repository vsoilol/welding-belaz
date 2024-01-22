using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;
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
            new ProductionAreaIdRequest {ProductionAreaId = productionAreaId}
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

    [HttpPut("acceptedAmount")]
    [ProducesResponseType(typeof(ChangeProductAccountAmountRequest), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductAccountDto>> ChangAcceptedAmountAsync(
        [FromBody] ChangeProductAccountAcceptedAmountRequest request
    )
    {
        var result = await _productAccountService.ChangAcceptedAmountAsync(request);

        return result.ToOk();
    }

    [HttpPut("assignWeldingEquipments")]
    public async Task<ActionResult<Unit>> AssignProductAccountToWeldingEquipmentsAsync(
        [FromBody] AssignProductAccountToWeldingEquipmentsRequest request
    )
    {
        var result = await _productAccountService.AssignProductAccountToWeldingEquipmentsAsync(
            request
        );

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

    [HttpPost("generateEmpty")]
    [ProducesResponseType(typeof(List<ProductAccountDto>), StatusCodes.Status200OK)]
    public async Task<ActionResult<List<ProductAccountDto>>> GenerateEmptyAsync(
        [FromBody] GenerateProductAccountsEmptyRequest request
    )
    {
        var result = await _productAccountService.GenerateEmptyAsync(request);

        return result.ToOk();
    }

    [HttpPut("reason")]
    [ProducesResponseType(typeof(ProductAccountDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductAccountDto>> SetProductAccountDefectiveReasonAsync(
        [FromBody] SetProductAccountDefectiveReasonRequest request
    )
    {
        var result = await _productAccountService.SetProductAccountDefectiveReasonAsync(request);

        return result.ToOk();
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<Unit>> RemoveProductAccountAsync([FromRoute] Guid id)
    {
        var result = await _productAccountService.RemoveProductAccountAsync(
            new RemoveProductAccountRequest
            {
                Id = id
            });
        return result.ToOk();
    }

    [HttpPost]
    [ProducesResponseType(typeof(ProductAccountDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductAccountDto>> AddProductAccountAsync(
        [FromBody] AddProductAccountRequest request)
    {
        var result = await _productAccountService.AddProductAccountAsync(request);
        return result.ToOk();
    }

    [HttpPut("unique-number")]
    [ProducesResponseType(typeof(ProductAccountDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductAccountDto>> SetUniqueNumberAsync(
        [FromBody] SetUniqueNumberForProductRequest request)
    {
        var result = await _productAccountService.SetUniqueNumberAsync(request);
        return result.ToOk();
    }

    [HttpPut("edit")]
    [ProducesResponseType(typeof(ProductAccountDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductAccountDto>> EditProductAccountAsync(
        [FromBody] EditProductAccountRequest request)
    {
        var result = await _productAccountService.EditProductAccountAsync(request);
        return result.ToOk();
    }

    [HttpPut("update-defective-amount")]
    [ProducesResponseType(typeof(ProductAccountDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductAccountDto>> ChangeDefectiveAmountAsync(
        [FromBody] ChangeDefectiveAmountRequest request)
    {
        var result = await _productAccountService.ChangeDefectiveAmountAsync(request);
        return result.ToOk();
    }

    [HttpPut("update-welding-end-date")]
    [ProducesResponseType(typeof(ProductAccountDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<ProductAccountDto>> ChangeEndWeldingDateAsync(
        [FromBody] ChangeEndWeldingDateRequest request)
    {
        var result = await _productAccountService.ChangeEndWeldingDateAsync(request);
        return result.ToOk();
    }
}